using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace Ava
{
    using static VMExts;
    using EncodedVar = System.Int32;


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
    public record MetaContext
    {
        public int nlocal = 0;
        public bool useMeta = false;
        public Dictionary<string, EncodedVar> ctx;
        public Dictionary<string, (int, EncodedVar)> freevars;
        public MetaContext parent = null;
        public Dictionary<int, string> filenames;
        public string filename;
        public Dictionary<DObj, int> consts;
        public Dictionary<string, int> strings;
        public List<int> bytecode;

        public List<(int, SourcePos)> sourcePos;


        // no need to init
        public List<int> currentLoopBreakOperands;
        public int currentLoopContinueTarget = -1;


        public void addCode(params int[] codes)
        {
            bytecode.AddRange(codes);
        }

        public void addCode(BC bc)
        {
            bytecode.Add((int)bc);
        }

        public void addCode(BC bc, int op)
        {
            if (bc == BC.LOAD_LOCAL && op < 0)
            {
                bc = BC.LOAD_FREE;
                op = -1 - op;
            }
            if (bc == BC.STORE_LOCAL && op < 0)
            {
                bc = BC.STORE_FREE;
                op = -1 - op;
            }
            bytecode.Add((int)bc);
            bytecode.Add(op);
        }
        public void setCode(int offset, int v)
        {
            bytecode[offset] = v;
        }

        public int currentOffset => bytecode.Count;

        public int strIdx(string s)
        {
            if (strings.TryGetValue(s, out int i))
                return i;
            i = strings.Count;
            strings[s] = i;
            return i;
        }
        public int objIdx(DObj s)
        {
            if (consts.TryGetValue(s, out var i))
                return i;
            i = consts.Count;
            consts[s] = i;
            return i;
        }
        public static MetaContext Create(string filename, bool useMeta = false)
        {
            return new MetaContext
            {
                ctx = new Dictionary<string, EncodedVar>(),
                useMeta = useMeta,
                parent = null,
                bytecode = new List<int>(),
                filename = filename,
                sourcePos = new List<(int, SourcePos)>(),
                nlocal = 0,
                consts = new Dictionary<DObj, int>(),
                strings = new Dictionary<string, int>(),
                filenames = new Dictionary<int, string>(),
                freevars = new Dictionary<string, (int, int)>(),
            };
        }

        public SourcePos currentPos =>
            sourcePos.Count == 0 ? new SourcePos(0, 0, filename) : sourcePos[sourcePos.Count - 1].Item2;
        public static MetaContext Create(MetaContext p, Dictionary<string, EncodedVar> ctx)
        {
            return new MetaContext
            {

                ctx = ctx,
                useMeta = p.useMeta,
                parent = p,
                bytecode = new List<int>(),
                filename = p.filename,
                sourcePos = new List<(int, SourcePos)> { (0, p.currentPos) },
                nlocal = ctx.Count,
                consts = new Dictionary<DObj, int>(),
                strings = new Dictionary<string, int>(),
                filenames = new Dictionary<int, string>(),
                freevars = new Dictionary<string, (int, int)>(),
            };
        }

        public EncodedVar? search(string s)
        {
            if (parent == null)
                return null;

            if (ctx.TryGetValue(s, out var ret))
            {
                return ret;
            }

            var x = parent.search(s);
            if (x.HasValue)
            {
                var i = freevars.Count;
                freevars[s] = (x.Value, i);
                var j = -i - 1;
                ctx[s] = j;
                x = j;
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

        internal void addLoopBreak(int operand)
        {
            if (currentLoopBreakOperands == null)
            {
                throw new InvalidOperationException("break not allowed outside loop");
            }
            currentLoopBreakOperands.Add(operand);
        }

        internal void addLoopContinue(int operand)
        {
            if (currentLoopContinueTarget == -1)
                throw new InvalidOperationException("continue not allowed outside loop");
            addCode(BC.GOTO, currentLoopContinueTarget);
        }


        internal void enterLoop(Action f)
        {
            var oldTarget = currentLoopContinueTarget;
            var oldOps = currentLoopBreakOperands;
            currentLoopContinueTarget = currentOffset;
            currentLoopBreakOperands = new List<int>();
            f();
            foreach (var op in currentLoopBreakOperands)
            {
                setCode(op, currentOffset);
            }
            currentLoopBreakOperands = oldOps;
            currentLoopContinueTarget = oldTarget;
        }

        public ((int, int)[], CodeObject) buildCode(SourcePos initPos, string[] args, string name_str = "<main>")
        {


            var _free = freevars.OrderBy(x => x.Value.Item2).ToArray();

            var freenames = _free.Select(x => x.Key).ToArray();
            var freetrans = _free.Select(x => x.Value).ToArray();


            var narg = args.Length;
            var argstrs = args.Select(x => x).ToArray();
            var consts_ = consts
                            .ToList()
                            .OrderBy(x => x.Value)
                            .Select(x => x.Key).ToArray();
            var strings_ = strings
                            .ToList()
                            .OrderBy(x => x.Value)
                            .Select(x => x.Key).ToArray();
            var localnames_ = ctx
                            .ToList()
                            .OrderBy(x => x.Value)
                            .Select(x => x.Key).ToArray();


            var code = new CodeObject(
                name: name_str, consts: consts_, bytecode: bytecode.ToArray(), strings: strings_, localnames: localnames_, sourcePos: sourcePos.ToArray(), narg: narg, nlocal: nlocal, freenames: freenames, pos: currentPos);

            return (freetrans, code);
        }
    }

    public static class Resolver
    {
        public static void __resolve_local(this DObj self, MetaContext ctx) { }
        public static void __resolve_local(this int self, MetaContext ctx) { }
        public static void __resolve_local(this string self, MetaContext ctx) { }
        public static void __resolve_local(this string[] self, MetaContext ctx) { }
        public static void __resolve_local(this ImmediateAST[] self, MetaContext ctx)
        {
            foreach (var ast in self)
                ast.__resolve_local(ctx);
        }
        public static void __resolve_local(this (ImmediateAST, ImmediateAST)[] self, MetaContext ctx)
        {
            foreach (var (a1, a2) in self)
            {
                a1.__resolve_local(ctx);
                a2.__resolve_local(ctx);
            }
        }
    }


    public interface ImmediateAST
    {
        string description { get; }
        int Lineno { get; set; }
        int Colno { get; set; }

        public bool is_stmt => false;
        public void emit_impl(MetaContext ctx);

        public void emit(MetaContext ctx)
        {
            if (!ctx.useMeta)
            {
                new SourcePos(Lineno, Colno, ctx.filename).visit(ctx);
            }
            emit_impl(ctx);
        }

        public void __default_resolve_local(MetaContext ctx);
        public void __resolve_local(MetaContext ctx)
        {
            __default_resolve_local(ctx);
        }
    }

    public partial class Meta
    {
        public void emit_impl(MetaContext ctx)
        {
            new SourcePos(lineno, colno, ctx.filenames[filename_idx]).visit(ctx);
        }
    }


    public partial class Raise
    {   
        public bool is_stmt => true;
        public void emit_impl(MetaContext ctx)
        {
            expr.emit(ctx);
            ctx.addCode(BC.RAISE);
        }
    }


    public partial class SetMeta
    {
        public bool is_stmt => true;
        public void emit_impl(MetaContext ctx)
        {
            ctx.useMeta = true;
            ctx.filenames[idx] = filename;
        }
    }


    public partial class StoreMany
    {
        public bool is_stmt => true;
        public void emit_impl(MetaContext ctx)
        {

            var insts = new Stack<(BC, int)>();
            for (int i = 0; i < lhs.Length; i++)
            {
                switch (lhs[i])
                {
                    case Load var:
                        var n_ = ctx.search(var.n);
                        if (n_.HasValue)
                            insts.Push((BC.STORE_LOCAL, n_.Value));
                        else
                            insts.Push((BC.STORE_GLOBAL, ctx.strIdx(var.n)));
                        break;
                    case OGet get:
                        get.target.emit(ctx);
                        get.item.emit(ctx);
                        insts.Push((BC.STORE_ITEM, 0));
                        break;
                    default:
                        throw new NotFiniteNumberException();
                }
            }

            rhs.emit_impl(ctx);
            BC a;
            int b;
            for (int i = 0; i < lhs.Length - 2; i++)
            {
                ctx.addCode(BC.DUP);
                (a, b) = insts.Pop();
                if (a == BC.STORE_ITEM)
                {
                    ctx.addCode(a);
                }
                else
                {
                    ctx.addCode(a, b);
                }
            }
            (a, b) = insts.Pop();
            if (a == BC.STORE_ITEM)
            {
                ctx.addCode(a);
            }
            else
            {
                ctx.addCode(a, b);
            }
        }
    }


    public static class Prime2
    {
        static List<Func<DObj, DObj, DObj>> funcs = new List<Func<DObj, DObj, DObj>>();

        static Dictionary<string, int> indices = new Dictionary<string, int>();

        public static DObj callfunc2(int i, DObj l, DObj r)
        {
            return funcs[i](l, r);
        }

        // [MethodImpl(MethodImplOptions.AggressiveInlining)]
        // public static DObj callfunc2(int i, DObj l, DObj r)
        // {
        //     switch(i)
        //     {
        //         case 0: 
        //             return l.__add__(r);
        //         case 1:
        //             return l.__sub__(r);
        //         case 2:
        //             return l.__mul__(r);
        //         case 3:
        //              return l.__pow__(r);
        //         case 4:
        //             return l.__truediv__(r);
        //         case 5:
        //             return l.__floordiv__(r);
        //         case 6:
        //             return l.__bitxor__(r);
        //         case 7:
        //             return l.__bitor__(r);
        //         case 8:
        //             return l.__bitand__(r);
        //         case 9:
        //             return MK.Int(l.__eq__(r));
        //         case 10:
        //             return MK.Int(!l.__eq__(r));
        //         case 11:
        //             return MK.Int(
        //                     !l.__lt__(r) &&
        //                     !l.__eq__(r)
        //                 );
        //         case 12:
        //             return MK.Int(!l.__lt__(r));
        //         case 13:
        //             return MK.Int(l.__lt__(r));
        //         case 14:
        //             return MK.Int(l.__lt__(r) || l.__eq__(r));

        //         case 15:
        //             return MK.Int(r.__contains__(l));
        //         case 16:
        //             return MK.Int(!r.__contains__(l));
        //         case 17:
        //             return l.__lshift__(r);
        //         case 18:
        //             return l.__rshift__(r);
        //         default:
        //             throw new NotImplementedException();
        //     }
        // }
        // public static Prime2()
        // {
        //     Prime2.addFunc("+");

        //     Prime2.addFunc("-");

        //     Prime2.addFunc("*", (l, r) => l.__mul__(r)

        //     );
        //     Prime2.addFunc("**", (l, r) => l.__pow__(r)

        //                     );
        //     Prime2.addFunc("/", (l, r) => l.__truediv__(r)

        //                     );
        //     Prime2.addFunc("//", (l, r) => l.__floordiv__(r)

        //                     );
        //     Prime2.addFunc("^", (l, r) => l.__bitxor__(r)

        //                     );
        //     Prime2.addFunc("|", (l, r) => l.__bitor__(r)

        //                     );
        //     Prime2.addFunc("&", (l, r) => l.__bitand__(r)

        //                     );
        //     Prime2.addFunc("==", (l, r) => MK.Int(l.__eq__(r))

        //                     );
        //     Prime2.addFunc("!=", (l, r) => MK.Int(!l.__eq__(r))

        //                     );
        //     Prime2.addFunc(">", (l, r) =>
        //                        {
        //                            return MK.Int(
        //                                !l.__lt__(r) &&
        //                                !l.__eq__(r)
        //                            );
        //                        }

        //                     );
        //     Prime2.addFunc(">=", (l, r) =>
        //                        {
        //                            return MK.Int(
        //                                !l.__lt__(r)
        //                            );
        //                        }
        //                     );
        //     Prime2.addFunc("<", (l, r) =>
        //                        {
        //                            return MK.Int(
        //                                l.__lt__(r)
        //                            );
        //                        }
        //                     );
        //     Prime2.addFunc("<=", (l, r) =>
        //                        {
        //                            return MK.Int(
        //                                l.__lt__(r) || l.__eq__(r)
        //                            );
        //                        }

        //                     );
        //     Prime2.addFunc("in", (l, r) =>
        //                        {
        //                            return MK.Int(
        //                                r.__contains__(l)
        //                            );
        //                        }

        //                     );
        //     Prime2.addFunc("notin", (l, r) =>
        //                        {
        //                            return MK.Int(
        //                                !r.__contains__(l)
        //                            );
        //                        }

        //                     );
        //     Prime2.addFunc("<<", (l, r) =>
        //                        {
        //                            return l.__lshift__(r);
        //                        }
        //                     );
        //     Prime2.addFunc(">>",
        //                         (l, r) =>
        //                         {
        //                             return l.__rshift__(r);
        //                         });

        // }
        // }

        public static int getFuncIdx(string n)
        {
            return indices[n];
        }
        public static int addFunc(string n, Func<DObj, DObj, DObj> func)
        {
            if (indices.TryGetValue(n, out int i))
            {
                return i;
            }
            funcs.Add(func);
            i = funcs.Count - 1;
            indices[n] = i;
            return i;
        }

    }

    public partial class Bin
    {


        static Bin()
        {
            Prime2.addFunc("+", (l, r) => l.__add__(r));

            Prime2.addFunc("-", (l, r) => l.__sub__(r));

            Prime2.addFunc("*", (l, r) => l.__mul__(r));
            Prime2.addFunc("**", (l, r) => l.__pow__(r));
            Prime2.addFunc("/", (l, r) => l.__truediv__(r));
            Prime2.addFunc("//", (l, r) => l.__floordiv__(r));
            Prime2.addFunc("%", (l, r) => l.__mod__(r));
            Prime2.addFunc("^", (l, r) => l.__bitxor__(r));
            Prime2.addFunc("|", (l, r) => l.__bitor__(r));
            Prime2.addFunc("&", (l, r) => l.__bitand__(r));
            Prime2.addFunc("==", (l, r) => MK.Int(l.__eq__(r)));
            Prime2.addFunc("!=", (l, r) => MK.Int(!l.__eq__(r)));
            Prime2.addFunc(">", (l, r) =>
                               {
                                   return MK.Int(
                                       !l.__lt__(r) &&
                                       !l.__eq__(r)
                                   );
                               }

                            );
            Prime2.addFunc(">=", (l, r) =>
                               {
                                   return MK.Int(
                                       !l.__lt__(r)
                                   );
                               }
                            );
            Prime2.addFunc("<", (l, r) =>
                               {
                                   return MK.Int(
                                       l.__lt__(r)
                                   );
                               }
                            );
            Prime2.addFunc("<=", (l, r) =>
                               {
                                   return MK.Int(
                                       l.__lt__(r) || l.__eq__(r)
                                   );
                               }

                            );
            Prime2.addFunc("in", (l, r) =>
                               {
                                   return MK.Int(
                                       r.__contains__(l)
                                   );
                               }

                            );
            Prime2.addFunc("notin", (l, r) =>
                               {
                                   return MK.Int(
                                       !r.__contains__(l)
                                   );
                               }

                            );
            Prime2.addFunc("<<", (l, r) =>
                               {
                                   return l.__lshift__(r);
                               }
                            );
            Prime2.addFunc(">>",
                                (l, r) =>
                                {
                                    return l.__rshift__(r);
                                });

        }
    }
    public partial class IBin
    {
        public bool is_stmt => true;
        public void emit_impl(MetaContext ctx)
        {
            Action storeOp;
            switch (left)
            {
                case Load var:
                    var n_ = ctx.search(var.n);
                    if (n_.HasValue)
                    {
                        ctx.addCode(BC.LOAD_LOCAL, n_.Value);
                        storeOp = () => ctx.addCode(BC.STORE_LOCAL, n_.Value);
                    }
                    else
                    {
                        ctx.addCode(BC.LOAD_GLOBAL, ctx.strIdx(var.n));
                        storeOp = () => ctx.addCode(BC.STORE_GLOBAL, ctx.strIdx(var.n));
                    }
                    break;
                case OGet get:
                    get.target.emit(ctx);
                    get.item.emit(ctx);
                    ctx.addCode(BC.DUP2);
                    ctx.addCode(BC.LOAD_ITEM);
                    storeOp = () => ctx.addCode(BC.STORE_ITEM);
                    break;
                default:
                    throw new NotFiniteNumberException();
            }
            right.emit_impl(ctx);
            ctx.addCode(BC.CALL_PRIME2, Prime2.getFuncIdx(op));
            storeOp();
        }

    }

    public partial class Bin
    {
        public void emit_impl(MetaContext ctx)
        {
            left.emit_impl(ctx);
            right.emit_impl(ctx);
            if (op == "+")
            {
                ctx.addCode(BC.BADD);
            }
            else if (op == "-")
            {
                ctx.addCode(BC.BSUB);
            }
            else if (op == "<")
            {
                ctx.addCode(BC.BLT);
            }
            else
            {
                ctx.addCode(BC.CALL_PRIME2, Prime2.getFuncIdx(op));
            }
        }
    }

    public partial class Load
    {
        public void emit_impl(MetaContext ctx)
        {
            var lhs_ = ctx.search(n);
            if (!lhs_.HasValue)
            {
                ctx.addCode(BC.LOAD_GLOBAL, ctx.strIdx(n));
            }
            else
            {
                ctx.addCode(BC.LOAD_LOCAL, lhs_.Value);
            }
        }
    }

    public partial class IfThenElse
    {
        public void emit_impl(MetaContext ctx)
        {
            cond.emit(ctx);

            var else_operand = ctx.currentOffset + 1;
            ctx.addCode(BC.GOTO_IF_NOT, PSEUDO);

            then.emit(ctx);

            var succ_operand = ctx.currentOffset + 1;
            ctx.addCode(BC.GOTO, PSEUDO);

            ctx.setCode(else_operand, ctx.currentOffset);
            orelse.emit(ctx);

            ctx.setCode(succ_operand, ctx.currentOffset);
        }
    }


    public partial class NestedIf
    {
        public void emit_impl(MetaContext ctx)
        {

            var PSEUDO = 0;

            var end_label_operands = new List<int>();
            Action<int> backset = (_) => { };
            foreach (var (cond, body) in elifs)
            {
                backset(ctx.currentOffset);

                cond.emit(ctx);

                var next_label_op = ctx.currentOffset + 1;
                ctx.addCode(BC.GOTO_IF_NOT, PSEUDO);

                body.emit(ctx);

                end_label_operands.Add(ctx.currentOffset + 1);
                ctx.addCode(BC.GOTO, PSEUDO);

                backset = (i) => ctx.setCode(next_label_op, i);
            }

            backset(ctx.currentOffset);
            if (orelse != null)
                orelse.emit(ctx);
            else
                ctx.addCode(BC.PUSHCONST, ctx.objIdx(MK.None()));

            int end_label = ctx.currentOffset;
            foreach (var op in end_label_operands)
            {
                ctx.setCode(op, end_label);
            }
        }
    }

    public partial class While
    {
        public bool is_stmt => true;
        public void emit_impl(MetaContext ctx)
        {
            // var backjump_offset = ctx.currentOffset;
            ctx.enterLoop(() =>
            {
                cond.emit(ctx);

                var end_label = ctx.currentOffset + 1;
                ctx.addCode(BC.GOTO_IF_NOT, PSEUDO);

                then.emit(ctx);
                ctx.addCode(BC.POP);
                ctx.addCode(BC.GOTO, ctx.currentLoopContinueTarget);
                ctx.setCode(end_label, ctx.currentOffset);
            });
        }
    }


    public partial class Loop
    {
        public bool is_stmt => true;
        public void emit_impl(MetaContext ctx)
        {
            var backjump_offset = ctx.currentOffset;
            ctx.enterLoop(() =>
            {
                body.emit(ctx);
                ctx.addCode(BC.POP);
                ctx.addCode(BC.GOTO, backjump_offset);
            });
        }
    }


    public record DEnum(IEnumerator<DObj> iter) : DObj
    {
        public object Native => iter;
        public string Classname => throw new NotImplementedException();
        public DObj __next__()
        {
            if (iter.MoveNext())
            {
                return iter.Current;
            }
            return null;
        }


    }
    public partial class For
    {

        public bool is_stmt => true;
        public void emit_impl(MetaContext ctx)
        {
            var PSEUDO = 0;
            iter.emit(ctx);

            ctx.addCode(BC.FOR);

            ctx.enterLoop(() =>
           {
               var end_label = ctx.currentOffset + 1;
               ctx.addCode(BC.GET_NEXT, PSEUDO);
               var lhs = ctx.search(target);
               if (!lhs.HasValue)
                   ctx.addCode(BC.STORE_GLOBAL, ctx.strIdx(target));
               else
                   ctx.addCode(BC.STORE_LOCAL, lhs.Value);

               body.emit(ctx);
               ctx.addCode(BC.POP);

               ctx.addCode(BC.GOTO, ctx.currentLoopContinueTarget);
               ctx.setCode(end_label, ctx.currentOffset);
           });
        }

        public void __resolve_local(MetaContext ctx)
        {
            ctx.enter(target);
            body.__resolve_local(ctx);
        }
    }


    public partial class OGet
    {
        public void emit_impl(MetaContext ctx)
        {
            target.emit(ctx);
            item.emit(ctx);
            ctx.addCode(BC.LOAD_ITEM);
        }
    }

    public partial class Block
    {
        public void emit_impl(MetaContext ctx)
        {
            if (suite.Length == 0)
            {
                ctx.addCode(BC.PUSHCONST, ctx.objIdx(MK.None()));
                return;
            }
            suite[0].emit(ctx);
            var last = suite[0];

            foreach (var st in suite.Skip(1))
            {
                if (!last.is_stmt)
                {
                    ctx.addCode(BC.POP);
                }
                st.emit(ctx);
                last = st;
            }
            if (last.is_stmt)
            {
                ctx.addCode(BC.PUSHCONST, ctx.objIdx(MK.None()));
            }
        }
    }


    public partial class Call
    {
        
        public void emit_impl(MetaContext ctx)
        {
            f.emit(ctx);

            foreach (var arg in args)
                arg.emit(ctx);

            ctx.addCode(BC.CALL_FUNC, args.Length);
        }
    }


    public partial class Function
    {
        public void __resolve_local(MetaContext ctx) { }

        public void emit_impl(MetaContext ctx)
        {

            var name_i = ctx.search(name);
            var name_str = name;

            var subctx_dict = new Dictionary<string, int>();
            var subctx = MetaContext.Create(ctx, subctx_dict);

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

            subctx.nlocal = args.Length;
            var currentPos = ctx.currentPos;
            body.__resolve_local(subctx);
            body.emit(subctx);

            var bind_scope = true;
            if (name_str == "")
            {
                name_str = "<lambda>";
                bind_scope = false;

            }

            var (freetrans, code) = subctx.buildCode(currentPos, args, name_str);

            var operand = ctx.objIdx(code);

            ctx.addCode(BC.PUSHCONST, operand);
            ctx.addCode(BC.MK_FUNC, freetrans.Length);
            foreach (var (from, to) in freetrans)
            {
                ctx.addCode(from, to);
            }
            if (bind_scope)
            {
                ctx.addCode(BC.DUP);
                if (!name_i.HasValue)
                    ctx.addCode(BC.STORE_GLOBAL, ctx.strIdx(name_str));
                else
                    ctx.addCode(BC.STORE_LOCAL, name_i.Value);
            }
        }
    }

    public partial class CVal
    {
        public void emit_impl(MetaContext ctx)
        {
            ctx.addCode(BC.PUSHCONST, ctx.objIdx(obj));
        }

    }

    public partial class CList
    {
        public void emit_impl(MetaContext ctx)
        {
            foreach (var elt in elts)
            {
                elt.emit(ctx);
            }
            ctx.addCode(BC.MK_LIST, elts.Length);
        }

    }

    public partial class CTuple
    {
        public void emit_impl(MetaContext ctx)
        {
            foreach (var elt in elts)
            {
                elt.emit(ctx);
            }
            ctx.addCode(BC.MK_TUPLE, elts.Length);
        }
    }

    public partial class CDict
    {
        public void emit_impl(MetaContext ctx)
        {
            foreach (var (k, v) in pairs)
            {
                k.emit(ctx);
                v.emit(ctx);
            }
            ctx.addCode(BC.MK_DICT, pairs.Length);
        }
    }

    public partial class CSet
    {
        public void emit_impl(MetaContext ctx)
        {
            foreach (var v in elts)
            {
                v.emit(ctx);
            }
            ctx.addCode(BC.MK_SET, elts.Length);
        }
    }

    public partial class CStrDict
    {
        public void emit_impl(MetaContext ctx)
        {
            foreach (var (k, v) in pairs)
            {
                k.emit(ctx);
                v.emit(ctx);
            }
            ctx.addCode(BC.MK_STRDICT, pairs.Length);
        }
    }

    public partial class And
    {
        public void emit_impl(MetaContext ctx)
        {
            left.emit(ctx);
            var jump_operand = ctx.currentOffset + 1;
            ctx.addCode(BC.GOTO_IF_NOT_AND_NO_POP, PSEUDO);
            right.emit(ctx);
            ctx.setCode(jump_operand, ctx.currentOffset);
        }
    }

    public partial class Or
    {
        public void emit_impl(MetaContext ctx)
        {
            left.emit(ctx);
            var jump_operand = ctx.currentOffset + 1;
            ctx.addCode(BC.GOTO_IF_AND_NO_POP, PSEUDO);
            right.emit(ctx);
            ctx.setCode(jump_operand, ctx.currentOffset);
        }
    }


    public partial class Not
    {
        public void emit_impl(MetaContext ctx)
        {
            value.emit(ctx);
            ctx.addCode(BC.NOT);
        }
    }

    public partial class Neg
    {
        public void emit_impl(MetaContext ctx)
        {
            value.emit(ctx);
            ctx.addCode(BC.NEG);
        }
    }

    public partial class Inv
    {
        public void emit_impl(MetaContext ctx)
        {
            value.emit(ctx);
            ctx.addCode(BC.INV);
        }
    }

    public partial class Decl
    {
        public bool is_stmt => true;
        public void emit_impl(MetaContext ctx) { }

        public void __resolve_local(MetaContext ctx)
        {
            foreach (var name in names)
            {
                Console.WriteLine(name);
                ctx.enter(name);
            }
        }
    }

    public partial class Return
    {
        public void emit_impl(MetaContext ctx)
        {
            if (value != null)
                value.emit(ctx);
            else
                ctx.addCode(BC.PUSHCONST, ctx.objIdx(MK.None()));

            ctx.addCode(BC.RETURN);
        }
    }

    public partial class Continue
    {
        public bool is_stmt => true;
        public void emit_impl(MetaContext ctx)
        {
            int operand = ctx.currentOffset + 1;
            ctx.addLoopContinue(operand);
        }
    }

    public partial class Break
    {
        public bool is_stmt => true;
        public void emit_impl(MetaContext ctx)
        {
            int operand = ctx.currentOffset + 1;
            ctx.addCode(BC.GOTO, PSEUDO);
            ctx.addLoopBreak(operand);
        }
    }
}