using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;

namespace Ava
{
    using EncodedVar = System.Int32;
    using ExecType = Func<ExecContext, DObj>;

    public static partial class CollectionExts
    {
        public static Dictionary<K, V> ShallowCopy<K, V>(this Dictionary<K, V> self)
        {
            var res = new Dictionary<K, V>();
            foreach (var kv in self)
            {
                res[kv.Key] = kv.Value;
            }
            return res;
        }
    }
    public enum VarKind
    {
        local,
        free,
        global
    }


    public class MetaContext
    {
        public int nlocal = 0;
        public Dictionary<string, EncodedVar> ctx;
        public List<(int parentSlot, int mySlot)> freevars;
        public MetaContext parent = null;

        public static MetaContext Create()
        {
            return new MetaContext
            {
                ctx = new Dictionary<string, EncodedVar>(),
                parent = null,
                freevars = new List<(EncodedVar parentSlot, EncodedVar mySlot)>(),
            };
        }

        public static MetaContext Create(MetaContext p, Dictionary<string, EncodedVar> ctx)
        {
            return new MetaContext { ctx = ctx, parent = p, freevars = new List<(EncodedVar parentSlot, EncodedVar mySlot)>() };
        }

        public MetaContext create(Dictionary<string, EncodedVar> ctx)
        {
            return new MetaContext
            { ctx = ctx, parent = this, freevars = new List<(EncodedVar parentSlot, EncodedVar mySlot)>() };
        }

        public EncodedVar search(string s)
        {
            if (parent == null)
                return -1;

            if (ctx.TryGetValue(s, out var ret))
            {
                return ret;
            }

            var x = parent.search(s);
            if (x >= 0)
            {
                var i = nlocal++;
                ctx[s] = i;
                freevars.Add((x, i));
                x = i;
            }

            return x;
        }

        public EncodedVar enter(string s)
        {
            if (parent == null) // store variables in the global scope
            {
                return -1;
            }
            if (ctx.TryGetValue(s, out var ret))
            {
                return ret;
            }
            int i = nlocal++;
            ctx[s] = i;
            return i;
        }


        public EncodedVar enter_force(string s)
        {
            if (parent == null) // store variables in the global scope
            {
                return -1;
            }
            var new_ctx = ctx.ShallowCopy();
            var i = new_ctx[s] = nlocal++;
            ctx = new_ctx;
            return i;
        }
    }

    public class ExecContext // if to extend, please make a construct for it.
    {
        public DObj[] locals;
        public Dictionary<string, DObj> globals;
        public int exitingLoop = 0;
        public List<(int, int, string)> frames;

        public ExecContext(
            Dictionary<string, DObj> globals,
            List<(int, int, string)> frames,
            DObj[] locals = null,
            int exitingLoop = 0)
        {
            this.globals = globals;
            this.frames = frames;
            this.locals = locals ?? new DObj[] { };
        }

        public static ExecContext ofGlobals(Dictionary<string, DObj> globals, List<(int, int, string)> frames = null)
        {
            frames = frames ?? new List<(int, int, string)>();
            return new ExecContext(globals: globals, frames: frames);
        }
    }


    public interface ImmediateAST
    {
        string description { get; }
        int Lineno { get; }
        int Colno { get; }
        ExecType compile_impl(MetaContext ctx);
    }

    public static class ImmediateASTExt
    {
        public static ExecType compile(this ImmediateAST self, MetaContext ctx)
        {
            var frame = (self.Lineno, self.Colno, self.description);
            var callable = self.compile_impl(ctx);
#if MAX_PERFORMANCE
            return callable;
#endif
            return (ExecContext ctx) =>
            {
                try
                {
                    return callable(ctx);
                }
                catch
                {
                    ctx.frames.Add(frame);
                    throw;
                }
            };
        }
    }

    public partial class Store : ImmediateAST
    {
        // public string lhs { get; set; }
        // public ImmediateAST rhs { get; set; }

        // public int lineno { get; set; }

        // public int colno { get; set; }

        public static Action<ExecContext, DObj> storevar(int lhs_, string lhs_string)
        {
            if (lhs_ < 0)
                return (ExecContext ctx, DObj v) =>
                    {
                        ctx.globals[lhs_string] = v;
                    }
                    ;
            else
                return (ExecContext ctx, DObj v) =>
                {
                    ctx.locals[lhs_] = v;
                };
        }
        public ExecType compile_impl(MetaContext ctx)
        {
            int lhs_ = ctx.enter(lhs);
            var rhs_ = rhs.compile(ctx);
            var store_func = storevar(lhs_, lhs);
            return ctx =>
            {
                store_func(ctx, rhs_(ctx));
                return DNone.unique;
            };
        }
    }

    public partial class StoreMany : ImmediateAST
    {
        // public string lhs { get; set; }
        // public ImmediateAST rhs { get; set; }

        // public int lineno { get; set; }

        // public int colno { get; set; }

        public ExecType compile_impl(MetaContext ctx)
        {
            var acts = new Action<ExecContext, DObj>[lhs.Length];
            for (var i = 0; i < acts.Length; i++)
            {
                var each = lhs[i];
                if (each is Load load)
                {
                    var n_i = ctx.enter(load.n);
                    var lhs_string = load.n;
                    if (n_i < 0)
                    {
                        acts[i] = (ExecContext ctx, DObj value) => { ctx.globals[lhs_string] = value; };
                    }
                    else
                    {
                        acts[i] = (ExecContext ctx, DObj value) =>
                        {
                            ctx.locals[n_i] = value;
                        };
                    }
                }
                else if (each is OGet oget)
                {
                    var item_ = oget.item.compile(ctx);
                    var target_ = oget.target.compile(ctx);

                    acts[i] = (ExecContext ctx, DObj value) =>
                    {
                        var t = target_(ctx);
                        var it = item_(ctx);
                        t.__set__(it, value);
                    };
                }
                else
                    throw new InvalidOperationException();
            }

            var rhs_ = rhs.compile(ctx);

            return (ExecContext ctx) =>
            {
                var val = rhs_(ctx);
                for (var i = 0; i < acts.Length; i++)
                    acts[i](ctx, val);
                return DNone.unique;
            };
        }
    }

    public partial class IBin : ImmediateAST
    {

        public ExecType compile_impl(MetaContext ctx)
        {
            Action<ExecContext, DObj> act;
            var bin_func = Bin.create_binary_op(op);

            if (left is Load load)
            {
                var n_i = ctx.enter(load.n);
                var lhs_string = load.n;
                if (n_i < 0)
                {
                    act = (ExecContext ctx, DObj value) =>
                    {
                        
                        try
                        {
                            var dObj = ctx.globals[lhs_string];                            
                            ctx.globals[lhs_string] = bin_func(dObj, value);
                        }
                        catch (KeyNotFoundException)
                        {
                            throw new NameError($"global variable {lhs_string} not found.");
                        }
                        
                    
                    };
                }
                else
                {
                    act = (ExecContext ctx, DObj value) =>
                    {
                        try
                        {
                            var dObj = ctx.locals[n_i] ??
                                throw new NameError($"local variable {lhs_string} used before definition!");

                            ctx.locals[n_i] = bin_func(dObj, value);
                        }
                        catch (KeyNotFoundException)
                        {
                            throw new NameError($"local variable {lhs_string} not found.");
                        }                        
                    };
                }
            }
            else if (left is OGet oget)
            {
                var item_ = oget.item.compile(ctx);
                var target_ = oget.target.compile(ctx);

                act = (ExecContext ctx, DObj value) =>
                {
                    var t = target_(ctx);
                    var it = item_(ctx);
                    t.__set__(it, bin_func(t.__get__(it), value));
                };
            }
            else
                throw new InvalidOperationException();
            
            var right_ = right.compile(ctx);
            return (ctx) =>
            {
                act(ctx, right_(ctx));
                return DNone.unique;
            };
            
        }
    }
    public partial class Bin : ImmediateAST
    {
        // public ImmediateAST left;

        // public int op;
        // public ImmediateAST right;

        // public int lineno { get; set; }
        // public int colno { get; set; }

        public static Func<DObj, DObj, DObj> create_binary_op(string op)
        {
            switch (op)
            {
                case "+":
                    return (l, r) => l.__add__(r);

                case "-":
                    return (l, r) => l.__sub__(r);

                case "*":
                    return (l, r) => l.__mul__(r);

                case "**":
                    return (l, r) => l.__pow__(r);

                case "/":
                    return (l, r) => l.__truediv__(r);

                case "//":
                    return (l, r) => l.__floordiv__(r);

                case "^":
                    return (l, r) => l.__bitxor__(r);

                case "|":
                    return (l, r) => l.__bitor__(r);

                case "&":
                    return (l, r) => l.__bitand__(r);

                case "==":
                    return (l, r) => MK.Int(l.__eq__(r));

                case "!=":
                    return (l, r) => MK.Int(!l.__eq__(r));

                case ">":
                    return (l, r) =>
                    {
                        return MK.Int(
                            !l.__lt__(r) &&
                            !l.__eq__(r)
                        );
                    };

                case ">=":
                    return (l, r) =>
                    {
                        return MK.Int(
                            !l.__lt__(r)
                        );
                    };
                case "<":
                    return (l, r) =>
                    {
                        return MK.Int(
                            l.__lt__(r)
                        );
                    };
                case "<=":
                    return (l, r) =>
                    {
                        return MK.Int(
                            l.__lt__(r) || l.__eq__(r)
                        );
                    };

                case "in":
                    return (l, r) =>
                    {
                        return MK.Int(
                            r.__contains__(l)
                        );
                    };

                case "notin":
                    return (l, r) =>
                    {
                        return MK.Int(
                            !r.__contains__(l)
                        );
                    };

                case "<<":
                    return (l, r) =>
                    {
                        return l.__lshift__(r);
                    };
                case ">>":
                    return (l, r) =>
                    {
                        return l.__rshift__(r);
                    };
                default:
                    throw new NotImplementedException(op);
            }
        
        }
        public ExecType compile_impl(MetaContext ctx)
        {
            var left_ = left.compile(ctx);
            var right_ = right.compile(ctx);
            var f = create_binary_op(op);
            return (ctx) => f(left_(ctx), right_(ctx));
        }
    }

    public partial class Load : ImmediateAST
    {
        //     public string n { get; set; }

        //     public int lineno { get; set; }

        //     public int colno { get; set; }

        public static ExecType loadvar(int lhs_, string lhs_string)
        {
            if (lhs_ < 0)

                return (ExecContext ctx) =>
                {
                    try
                    {
                        var dObj = ctx.globals[lhs_string];
                        return dObj;
                    }
                    catch (KeyNotFoundException)
                    {
                        throw new NameError($"global variable {lhs_string} not found.");
                    }
                };
            else

                return (ExecContext ctx) =>
                {
                    try
                    {
                        return ctx.locals[lhs_] ??
                               throw new NameError($"local variable {lhs_string} used before definition!");
                    }
                    catch (KeyNotFoundException)
                    {
                        throw new NameError($"local variable {lhs_string} not found.");
                    }
                };
        }
        public ExecType compile_impl(MetaContext ctx)
        {
            var lhs_string = n;
            var lhs_ = ctx.search(lhs_string);
            return loadvar(lhs_, lhs_string);
            
        }
    }


    public partial class IfThenElse : ImmediateAST
    {
        // public ImmediateAST cond { get; set; }
        // public ImmediateAST then { get; set; }
        // public ImmediateAST orelse { get; set; }

        // public int lineno { get; set; }

        // public int colno { get; set; }

        public ExecType compile_impl(MetaContext ctx)
        {
            var cond_ = cond.compile(ctx);
            var then_ = then.compile(ctx);
            var orelse_ = orelse.compile(ctx);

            return (ExecContext ctx) =>
            {
                if (cond_(ctx).__bool__())
                    return then_(ctx);
                return orelse_(ctx);
            };
        }
    }

    public partial class NestedIf : ImmediateAST
    {
        // public ImmediateAST cond { get; set; }
        // public ImmediateAST then { get; set; }
        // public ImmediateAST orelse { get; set; }

        // public int lineno { get; set; }

        // public int colno { get; set; }

        public ExecType compile_impl(MetaContext ctx)
        {

            var elifs_ = elifs.Select(x => (x.Item1.compile(ctx), x.Item2.compile(ctx))).ToArray();
            ExecType orelse_ = orelse?.compile(ctx);

            return (ExecContext ctx) =>
            {
                for (var i = 0; i < elifs.Length; i++)
                {
                    var (cond_, then_) = elifs_[i];
                    if (cond_(ctx).__bool__())
                        return then_(ctx);
                }
                if (orelse_ == null)
                    return MK.None();
                return orelse_(ctx);
            };
        }
    }

    public partial class Loop : ImmediateAST
    {
        // public ImmediateAST cond { get; set; }
        // public ImmediateAST then { get; set; }

        // public int lineno { get; set; }

        // public int colno { get; set; }

        public ExecType compile_impl(MetaContext ctx)
        {
            var body_ = body.compile(ctx);
            return (ExecContext ctx) =>
            {
                DObj ret = DNone.unique;
                while (true)
                {
                    ret = body_(ctx);
                    var eLoop = ctx.exitingLoop;
                    switch (eLoop)
                    {
                        case 0:
                            continue;
                        case 1:
                            ctx.exitingLoop = 0;
                            continue;
                        case 2:
                            ctx.exitingLoop = 0;
                            return ret;
                        default:
                            return ret;
                    }
                }
            };
        }
    }

    public partial class While : ImmediateAST
    {
        // public ImmediateAST cond { get; set; }
        // public ImmediateAST then { get; set; }

        // public int lineno { get; set; }

        // public int colno { get; set; }

        public ExecType compile_impl(MetaContext ctx)
        {

            var cond_ = cond.compile(ctx);
            var then_ = then.compile(ctx);
            return (ExecContext ctx) =>
            {
                DObj ret = DNone.unique;
                while (cond_(ctx).__bool__())
                {
                    ret = then_(ctx);
                    var eLoop = ctx.exitingLoop;
                    switch (eLoop)
                    {
                        case 0:
                            continue;
                        case 1:
                            ctx.exitingLoop = 0;
                            continue;
                        case 2:
                            ctx.exitingLoop = 0;
                            return ret;
                        default:
                            return ret;
                    }
                }

                return ret;
            };
        }
    }

    public partial class For : ImmediateAST
    {
        // public ImmediateAST cond { get; set; }
        // public ImmediateAST then { get; set; }

        // public int lineno { get; set; }

        // public int colno { get; set; }

        public ExecType compile_impl(MetaContext ctx)
        {

            var target_ = ctx.enter(target);
            var target_str = target;
            var iter_ = iter.compile(ctx);
            var body_ = body.compile(ctx);

            if (target_ < 0)
                return (ExecContext ctx) =>
                {
                    DObj ret = DNone.unique;
                    foreach (var each in iter_(ctx).__iter__())
                    {
                        ctx.globals[target_str] = each;
                        ret = body_(ctx);
                        var eLoop = ctx.exitingLoop;
                        switch (eLoop)
                        {
                            case 0:
                                continue;
                            case 1:
                                ctx.exitingLoop = 0;
                                continue;
                            case 2:
                                ctx.exitingLoop = 0;
                                return ret;
                            default:
                                return ret;
                        }
                    }

                    return ret;
                };
            else
                return (ExecContext ctx) =>
                {
                    DObj ret = DNone.unique;
                    foreach (var each in iter_(ctx).__iter__())
                    {
                        ctx.locals[target_] = each;
                        ret = body_(ctx);
                        var eLoop = ctx.exitingLoop;
                        switch (eLoop)
                        {
                            case 0:
                                continue;
                            case 1:
                                ctx.exitingLoop = 0;
                                continue;
                            case 2:
                                ctx.exitingLoop = 0;
                                return ret;
                            default:
                                return ret;
                        }
                    }

                    return ret;
                };
        }
    }

    public partial class OGet : ImmediateAST
    {
        // public ImmediateAST target { get; set; }
        // public ImmediateAST item { get; set; }
        // public int lineno { get; set; }

        // public int colno { get; set; }

        public ExecType compile_impl(MetaContext ctx)
        {
            var value_ = target.compile(ctx);
            var item_ = item.compile(ctx);

            return (ExecContext ctx) =>
            {
                var o = value_(ctx);
                var n = item_(ctx);
                return o.__get__(n);
            };
        }
    }

    public partial class Break : ImmediateAST
    {
        public ExecType compile_impl(MetaContext ctx)
        {
            return (ExecContext ctx) =>
            {
                ctx.exitingLoop = 2;
                return DNone.unique;
            };
        }
    }

    public partial class Continue : ImmediateAST
    {
        public ExecType compile_impl(MetaContext ctx)
        {
            return (ExecContext ctx) =>
            {
                ctx.exitingLoop = 1;
                return DNone.unique;
            };
        }
    }

    public partial class Return : ImmediateAST
    {
        public ExecType compile_impl(MetaContext ctx)
        {
            if (value == null)
            {
                return (ExecContext ctx) =>
                {
                    ctx.exitingLoop = 3;
                    return MK.None();
                };
            }
            var value_ = value.compile(ctx);

            return (ExecContext ctx) =>
            {
                var r = value_(ctx);
                ctx.exitingLoop = 3;
                return r;
            };
        }
    }

    public partial class OSet : ImmediateAST
    {
        // public ImmediateAST target { get; set; }
        // public ImmediateAST item { get; set; }
        // public ImmediateAST value { get; set; }
        // public int lineno { get; set; }

        // public int colno { get; set; }

        public ExecType compile_impl(MetaContext ctx)
        {
            var target_ = target.compile(ctx);
            var value_ = value.compile(ctx);
            var item_ = item.compile(ctx);

            return (ExecContext ctx) =>
            {
                var t = target_(ctx);
                var o = value_(ctx);
                var n = item_(ctx);
                t.__set__(n, o);
                return DNone.unique;
            };
        }
    }

    public partial class Block : ImmediateAST
    {
        // public int lineno { get; set; }

        // public int colno { get; set; }

        // public ImmediateAST[] suite { get; set; }
        public ExecType compile_impl(MetaContext ctx)
        {
            var old_ctx = ctx.ctx;
            var suite_ = suite.Select(x => x.compile(ctx)).ToArray();

            ctx.ctx = old_ctx; // This encloses let scope

            return (ExecContext ctx) =>
            {
                DObj ret = DNone.unique;
                for (var i = 0; i < suite_.Length; i++)
                {
                    ret = suite_[i](ctx);
                    if (ctx.exitingLoop != 0)
                        return ret;
                }

                return ret;
            };
        }
    }


    public partial class Call : ImmediateAST
    {
        // public int lineno { get; set; }

        // public int colno { get; set; }
        // public ImmediateAST f { get; set; }

        // public ImmediateAST[] args { get; set; }

        public ExecType compile_impl(MetaContext ctx)
        {
            var f_ = f.compile(ctx);
            var args_ = args.Select(x => x.compile(ctx)).ToArray();

            var n = args_.Length;

            return (ExecContext ctx) =>
            {
                var dObjs = new DObj[n];
                for (var i = 0; i < n; i++)
                {
                    dObjs[i] = args_[i](ctx);
                }

                return f_(ctx).__call__(dObjs);
            };
        }
    }

    public partial class Function : ImmediateAST
    {
        // public int lineno { get; set; }

        // public int colno { get; set; }

        // public string[] args { get; set; }
        // public ImmediateAST body { get; set; }
        public ExecType compile_impl(MetaContext ctx)
        {
            var name_i = ctx.enter(name);
            var name_str = name;

            var subctx_dict = new Dictionary<string, int>();
            for (var i = 0; i < args.Length; i++)
            {
                if (subctx_dict.ContainsKey(args[i]))
                {
                    // TODO: track and position compile time exceptions.
                    throw new NameError(
                        $"duplicate argument {args[i]} for function '{name}' at line {lineno}, column {colno}.");
                }

                subctx_dict[args[i]] = i;
            }


            var subctx = MetaContext.Create(ctx, subctx_dict);
            subctx.nlocal = args.Length;


            // ctx.create()
            var body_ = body.compile(subctx);
            var free = subctx.freevars.ToArray();

            var nlocal = subctx.nlocal;
            var narg = args.Length;
            var argstrs = args.Select(x => x).ToArray();
            var bind_scope = true;
            if (name_str == "")
            {
                name_str = "<lambda>";
                bind_scope = false;

            }


            return (ExecContext ctx) =>
            {
                DObj call(DObj[] args)
                {
                    if (args.Length < narg)
                    {
                        var left_params = String.Join(",", argstrs.Skip(args.Length));
                        throw new ArgumentException($"call {name_str}: argument(s) ({left_params}) not provided.");
                    }

                    var newlocals = new DObj[nlocal];
                    foreach (var (from, to) in free)
                    {
                        newlocals[to] = ctx.locals[from];
                    }

                    for (var i = 0; i < args.Length; i++)
                    {
                        newlocals[i] = args[i];
                    }

                    var newctx = new ExecContext(
                        locals: newlocals,
                        globals: ctx.globals,
                        frames: ctx.frames
                    );
                    return body_(newctx);
                }

                var f = new DFunc { name = name_str, func = call };

                if (bind_scope)
                {
                    if (name_i < 0)
                    {
                        ctx.globals[name_str] = f;
                    }
                    else
                    {
                        ctx.locals[name_i] = f;
                    }
                }
                return f;
            };
        }
    }

    public partial class CVal : ImmediateAST
    {
        public ExecType compile_impl(MetaContext ctx)
        {
            var o = obj;
            return (_) => o;
        }
    }
    public partial class CStr : ImmediateAST
    {
        public ExecType compile_impl(MetaContext ctx)
        {
            var o = MK.String(str);
            return (_) => o;
        }
    }

    public partial class CInt : ImmediateAST
    {
        public ExecType compile_impl(MetaContext ctx)
        {
            var o = MK.Int(value);
            return (_) => o;
        }
    }

    public partial class CFloat : ImmediateAST
    {
        public ExecType compile_impl(MetaContext ctx)
        {
            var o = MK.Float(value);
            return (_) => o;
        }
    }


    public partial class CNone : ImmediateAST
    {
        public ExecType compile_impl(MetaContext ctx)
        {
            return (_) => DNone.unique;
        }
    }

    public partial class CList : ImmediateAST
    {
        public ExecType compile_impl(MetaContext ctx)
        {
            var elts_ = elts.Select(elt => elt.compile(ctx)).ToArray();
            var n = elts.Length;

            return (ExecContext ctx) =>
            {
                var xs = new List<DObj>();
                for (var i = 0; i < n; i++)
                    xs.Add(elts_[i](ctx));
                return MK.List(xs);
            };
        }
    }

    public partial class CTuple : ImmediateAST
    {
        public ExecType compile_impl(MetaContext ctx)
        {
            var elts_ = elts.Select(elt => elt.compile(ctx)).ToArray();
            var n = elts.Length;

            return (ExecContext ctx) =>
            {
                var xs = new DObj[n];
                for (var i = 0; i < n; i++)
                    xs[i] = elts_[i](ctx);
                return MK.Tuple(xs);
            };
        }
    }

    public partial class And : ImmediateAST
    {
        public ExecType compile_impl(MetaContext ctx)
        {
            var left_ = left.compile(ctx);
            var right_ = right.compile(ctx);

            return (ExecContext ctx) => { return MK.Int(left_(ctx).__bool__() && right_(ctx).__bool__()); };
        }
    }

    public partial class Or : ImmediateAST
    {
        public ExecType compile_impl(MetaContext ctx)
        {
            var left_ = left.compile(ctx);
            var right_ = right.compile(ctx);

            return (ExecContext ctx) => { return MK.Int(left_(ctx).__bool__() || right_(ctx).__bool__()); };
        }
    }

    public partial class Not : ImmediateAST
    {
        public ExecType compile_impl(MetaContext ctx)
        {
            var value_ = value.compile(ctx);

            return (ExecContext ctx) => { return MK.Int(!value_(ctx).__bool__()); };
        }
    }

    public partial class Neg : ImmediateAST
    {
        public ExecType compile_impl(MetaContext ctx)
        {
            var value_ = value.compile(ctx);

            return (ExecContext ctx) => { return value_(ctx).__neg__(); };
        }
    }


    public partial class Inv : ImmediateAST
    {
        public ExecType compile_impl(MetaContext ctx)
        {
            var value_ = value.compile(ctx);

            return (ExecContext ctx) => { return value_(ctx).__inv__(); };
        }
    }

    public partial class CDict : ImmediateAST
    {
        public ExecType compile_impl(MetaContext ctx)
        {
            var elts_ = pairs.Select(x => (x.Item1.compile(ctx), x.Item2.compile(ctx))).ToArray();

            var n = elts_.Length;

            return (ExecContext ctx) =>
            {
                var xs = new Dictionary<DObj, DObj>();
                for (var i = 0; i < n; i++)
                {
                    var (k, v) = elts_[i];
                    xs[k(ctx)] = v(ctx);
                }

                return MK.Dict(xs);
            };
        }
    }

    public partial class Workflow : ImmediateAST
    {

        public ExecType compile_impl(MetaContext ctx)
        {


            (int lineno, int colno, string desc, DString attr, ExecType[] args)[] fs = new (int, int, string, DString, ExecType[])[options.Length];


            ExecType builder_ = Load.loadvar(ctx.search(builder), builder);            
            var binder = bindname == null ? null : Store.storevar(ctx.enter(bindname), bindname);
            int i = 0;
            foreach (var (l, c, task, args) in options)
            {
                fs[i++] = (l, c, task, MK.String(task), args.Select(x => x.compile(ctx)).ToArray());
            }

            int n = options.Length + 2;
            var start = MK.String("start");
            var finish = MK.String("finish");
            
            
            return (ExecContext ctx) =>
            {
                DObj ret = builder_(ctx);
                ret = ret.__get__(start).__call__(new DObj[0]);
                binder?.Invoke(ctx, ret);
                foreach (var (l, c, desc, attr, args) in fs)
                {
                    DObj[] argobjs = new DObj[args.Length];
                    try
                    {
                        for (var i = 0; i < args.Length; i++)
                        {
                            argobjs[i] = args[i](ctx);
                        }
                        ret.__get__(attr).__call__(argobjs);
                    }
                    catch
                    {
                        ctx.frames.Add((l, c, ret.__str__() + "." + desc));
                        throw;
                    }
                }
                ret.__get__(finish).__call__(new DObj[0]);
                return ret;
            };
        }

    }

    public partial class Let : ImmediateAST
    {
        public ExecType compile_impl(MetaContext ctx)
        {
            int lhs_ = ctx.enter(name);
            var lhs_string = name;
            var rhs_ = expr.compile(ctx);
            if (lhs_ >= 0)
            {
                var new_ctx = new Dictionary<string, int>();
                foreach (var kv in ctx.ctx)
                {
                    new_ctx[kv.Key] = kv.Value;
                }
                new_ctx[lhs_string] = lhs_;
                ctx.ctx = new_ctx;
            }
            if (lhs_ < 0)
                return (ExecContext ctx) =>
                    {
                        try
                        {
                            ctx.globals[lhs_string] = rhs_(ctx);
                        }
                        catch (KeyNotFoundException)
                        {
                            throw new NameError($"global variable {lhs_string} not found");
                        }

                        return DNone.unique;
                    }
                    ;
            else
                return (ExecContext ctx) =>
                {
                    ctx.locals[lhs_] = rhs_(ctx);
                    return DNone.unique;
                };
        }
    }

    public partial class Pipeline : ImmediateAST
    {

        public ExecType compile_impl(MetaContext ctx)
        {
            ImmediateAST block = Block.make(
                    funcs.Select(x => Let.make("_", x, x.Lineno, x.Colno) as ImmediateAST).Append(Load.make("_", lineno, colno)).ToArray(),
                    lineno, colno
                );
            if (ctx.parent == null)
            {
                block = Call.make(Function.make("", new string[0], block, lineno, colno), new ImmediateAST[0], lineno, colno);
            }
            return block.compile(ctx);
        }
    }
}