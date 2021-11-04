using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace Ava
{
    using EncodedVar = System.Int32;
    using NameSpace = Dictionary<string, DObj>;
    using ast = ImmediateAST;
    using CPS = Func<ExecContext, DObj>;
    public enum CONT
    {
        NORMAL = 0,
        RETURN = 1,
        BREAK = 2,
        CONT = 3

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
        public SourcePos currentPos;



        // no need to init
        public List<int> currentLoopBreakOperands;
        public int currentLoopContinueTarget = -1;

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
                filename = filename,
                currentPos = new SourcePos(0, 0, filename),
                nlocal = 0,
                consts = new Dictionary<DObj, int>(),
                strings = new Dictionary<string, int>(),
                filenames = new Dictionary<int, string>(),
                freevars = new Dictionary<string, (int, int)>(),
            };
        }


        public static MetaContext Create(MetaContext p, Dictionary<string, EncodedVar> ctx)
        {
            return new MetaContext
            {

                ctx = ctx,
                useMeta = p.useMeta,
                parent = p,
                filename = p.filename,
                currentPos = p.currentPos,
                nlocal = ctx.Count,
                consts = new Dictionary<DObj, int>(),
                strings = new Dictionary<string, int>(),
                filenames = p.filenames,
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

        public ((int, int)[], CodeObject) jitCode(SourcePos initPos, string[] args, string name_str = "<main>")
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
                name: name_str, consts: consts_, strings: strings_, localnames: localnames_, narg: narg, nlocal: nlocal, freenames: freenames, pos: initPos);

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

        public static void __resolve_local(this (ImmediateAST, string)[] self, MetaContext ctx)
        {
            foreach (var (a1, a2) in self)
            {
                a1.__resolve_local(ctx);
            }
        }
    }


    public interface ImmediateAST
    {
        string description { get; }
        int Lineno { get; set; }
        int Colno { get; set; }



        public void __default_resolve_local(MetaContext ctx);
        public void __resolve_local(MetaContext ctx)
        {
            __default_resolve_local(ctx);
        }

        public CPS jit_impl(MetaContext ctx);

        public CPS jit(MetaContext ctx)
        {
            if (!ctx.useMeta)
            {
                new SourcePos(Lineno, Colno, ctx.filename).visit(ctx);
            }

            var pos = ctx.currentPos;
            var cps = jit_impl(ctx);
            if (cps == null)
                return cps;
            return new __please_inline_it { call = cps, kind = description, pos = pos }.Invoke;
        }
    }

    public struct __please_inline_it
    {
        public SourcePos pos;
        public string kind;
        public CPS call;


        [MethodImpl(MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization)]
        public DObj Invoke(ExecContext ctx)
        {
            try
            {
                return call(ctx);
            }
            catch (Exception e)
            {
                throw new LocatedError(e, kind, pos);
            }
        }
    }

    public partial class Meta
    {

        public CPS jit_impl(MetaContext ctx)
        {
            ctx.currentPos = new SourcePos(lineno, colno, ctx.filenames[this.filename_idx]);
            return inner.jit(ctx);
        }
    }


    public partial class Raise
    {


        public struct __call
        {
            public CPS func;

            public DObj Invoke(ExecContext ctx)
            {
                var exp = func(ctx);
                if (ctx.CONT != 0)
                    return exp;
                throw new Exception(exp.__str__());
            }

        }

        public CPS jit_impl(MetaContext ctx)
        {
            var func = expr.jit(ctx);

            return new __call { func = func }.Invoke;
        }
    }


    public partial class SetMeta
    {
        public CPS jit_impl(MetaContext ctx)
        {
            ctx.useMeta = true;
            ctx.filenames[this.idx] = this.filename;
            return null;
        }
    }


    public partial class StoreMany
    {


        public struct __call_global_store_op
        {
            public string name;
            public CPS func;
            public Func<DObj, DObj, DObj> op;

            public DObj Invoke(ExecContext ctx)
            {
                var lhs = ctx.loadGlobal(name);
                var rhs = func(ctx);
                if (ctx.CONT != 0)
                    return rhs;
                var value = op(lhs, rhs);
                ctx.ns[name] = value;
                return value;
            }
        }

        public struct __call_local_store_op
        {
            public int localidx;
            public CPS func;
            public Func<DObj, DObj, DObj> op;

            public DObj Invoke(ExecContext ctx)
            {
                var lhs = ctx.loadLocal(localidx);
                var rhs = func(ctx);
                if (ctx.CONT != 0)
                    return rhs;
                var value = op(lhs, rhs);
                ctx.localvars[localidx] = value;
                return value;
            }
        }

        public struct __call_free_store_op
        {
            public int freeidx;
            public CPS func;
            public Func<DObj, DObj, DObj> op;

            public DObj Invoke(ExecContext ctx)
            {
                var lhs = ctx.loadFree(freeidx);
                var rhs = func(ctx);
                if (ctx.CONT != 0)
                    return rhs;
                var value = op(lhs, rhs);
                ctx.freevars[freeidx] = value;
                return value;
            }
        }

        public struct __call_item_store_op
        {
            public int localidx;
            public CPS subject;
            public CPS item;
            public CPS value;
            public Func<DObj, DObj, DObj> op;

            public SourcePos sourcePos;
            public DObj Invoke(ExecContext ctx)
            {

                var val_subject = subject(ctx);
                if (ctx.CONT != 0)
                    return val_subject;
                var val_item = item(ctx);
                if (ctx.CONT != 0)
                    return val_item;
                var rhs = value(ctx);
                if (ctx.CONT != 0)
                    return rhs;

                var lhs = val_subject.__get__(val_item);
                var ret = op(lhs, rhs);
                val_subject.__set__(val_item, ret);
                return ret;

            }
        }
        public struct __call_global_store
        {
            public string name;
            public CPS func;
            public DObj Invoke(ExecContext ctx)
            {
                var r = func(ctx);
                ctx.ns[name] = r;
                return r;
            }
        }

        public struct __call_local_store
        {
            public int localidx;
            public CPS func;
            public DObj Invoke(ExecContext ctx)
            {
                var r = func(ctx);
                ctx.localvars[localidx] = r;
                return r;
            }
        }

        public struct __call_free_store
        {
            public int freeidx;
            public CPS func;
            public DObj Invoke(ExecContext ctx)
            {
                var r = func(ctx);
                ctx.freevars[freeidx] = r;
                return r;
            }
        }

        public class __call_item_store
        {
            public int localidx;
            public CPS subject;

            public CPS item;

            public CPS value;
            public DObj Invoke(ExecContext ctx)
            {
                var val_subject = subject(ctx);
                if (ctx.CONT != 0)
                    return val_subject;
                var val_item = item(ctx);
                if (ctx.CONT != 0)
                    return val_item;
                var val_val = value(ctx);
                if (ctx.CONT != 0)
                    return val_val;
                val_subject.__set__(val_item, val_val);
                return val_val;
            }
        }

        public CPS jit_impl(MetaContext ctx)
        {

            List<Func<CPS, CPS>> transform = new List<Func<CPS, CPS>>();
            for (int i = 0; i < lhs.Length; i++)
            {
                switch (lhs[i])
                {
                    case (Load load, null):
                        {
                            var n_ = ctx.search(load.n);
                            if (!n_.HasValue)
                            {
                                transform.Add(cps => new __call_global_store { name = load.n, func = cps }.Invoke);
                            }
                            else if (n_.Value >= 0)
                                transform.Add(cps => new __call_local_store { localidx = n_.Value, func = cps }.Invoke);
                            else
                                transform.Add(cps => new __call_free_store { freeidx = -n_.Value - 1, func = cps }.Invoke);
                            break;
                        }
                    case (Load load, var op_str):
                        {
                            var pos = ctx.currentPos;
                            var n_ = ctx.search(load.n);
                            var op = Prime2.getFunc(op_str);
                            if (!n_.HasValue)
                            {
                                transform.Add(cps => new __call_global_store_op
                                {
                                    name = load.n,
                                    func = cps,
                                    op = op
                                }.Invoke);
                            }
                            else if (n_.Value >= 0)
                                transform.Add(cps => new __call_local_store_op
                                {
                                    localidx = n_.Value,
                                    func = cps,
                                    op = op
                                }.Invoke);
                            else //  (n_.Value < 0)
                                transform.Add(cps => new __call_free_store_op
                                {
                                    freeidx = -n_.Value - 1,
                                    func = cps,
                                    op = op
                                }.Invoke);
                            break;
                        }

                    case (OGet oget, null):
                        {
                            var subject = oget.target.jit(ctx);
                            var item = oget.item.jit(ctx);
                            transform.Add(cps => new __call_item_store { subject = subject, item = item, value = cps }.Invoke);
                            break;
                        }
                    case (OGet oget, var op_str):
                        {
                            var pos = ctx.currentPos;
                            var op = Prime2.getFunc(op_str);
                            var subject = oget.target.jit(ctx);
                            var item = oget.item.jit(ctx);
                            transform.Add(cps => new __call_item_store_op
                            {
                                subject = subject,
                                item = item,
                                value = cps,
                                op = op
                            }.Invoke);
                            break;
                        }
                }
            }

            var value = rhs.jit(ctx);
            return transform.ReduceRight(value, (r, e) => e(r));
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

    public partial class Bin
    {
        public struct __binary_call
        {
            public CPS left;
            public CPS right;
            public Func<DObj, DObj, DObj> op;
            public DObj Invoke(ExecContext ctx)
            {
                var l = left(ctx);
                if (ctx.CONT != 0)
                    return l;
                var r = right(ctx);
                if (ctx.CONT != 0)
                    return r;
                return op(l, r);
            }
        }
        public CPS jit_impl(MetaContext ctx) =>
            new __binary_call { left = left.jit(ctx), right = right.jit(ctx), op = Prime2.getFunc(op) }.Invoke;


    }

    public partial class Load
    {

        public struct __call_load_local
        {
            public int localidx;
            public DObj Invoke(ExecContext ctx) => ctx.loadLocal(localidx);
        }

        public struct __call_load_free
        {
            public int freeidx;
            public DObj Invoke(ExecContext ctx) => ctx.loadFree(freeidx);
        }

        public struct __call_load_global
        {
            public string name;
            public DObj Invoke(ExecContext ctx) => ctx.loadGlobal(name);
        }

        public CPS jit_impl(MetaContext ctx)
        {
            var lhs_ = ctx.search(n);
            if (!lhs_.HasValue)
            {
                return new __call_load_global { name = n }.Invoke;
            }
            else if (lhs_.Value >= 0)
            {
                return new __call_load_local { localidx = lhs_.Value }.Invoke;
            }
            else
            {
                return new __call_load_free { freeidx = -lhs_.Value - 1 }.Invoke;
            }
        }

    }

    public partial class IfThenElse
    {
        public struct __call_if
        {
            public CPS cond;
            public CPS then;
            public CPS orelse;

            [MethodImpl(MethodImplOptions.AggressiveOptimization)]
            public DObj Invoke(ExecContext ctx)
            {
                var val_cond = cond(ctx);
                if (ctx.CONT != 0)
                    return val_cond;
                if (val_cond.__bool__())
                {
                    return then(ctx);
                }
                else
                    return orelse(ctx);
            }
        }
        public CPS jit_impl(MetaContext ctx)
        {
            return new __call_if { cond = cond.jit(ctx), then = then.jit(ctx), orelse = orelse.jit(ctx) }.Invoke;
        }

    }


    public partial class NestedIf
    {
        public struct __call_if
        {
            public (CPS, CPS)[] elifs;
            public CPS orelse; // can be null

            [MethodImpl(MethodImplOptions.AggressiveOptimization)]
            public DObj Invoke(ExecContext ctx)
            {
                foreach (var (cond, then) in elifs)
                {
                    var val_cond = cond(ctx);
                    if (ctx.CONT != 0)
                        return val_cond;
                    if (val_cond.__bool__())
                        return then(ctx);
                }
                if (orelse == null)
                    return DNone.unique;
                return orelse(ctx);
            }
        }

        public CPS jit_impl(MetaContext ctx)
        {
            (CPS, CPS) ap((ast cond, ast then) arg)
            {
                return (arg.cond.jit(ctx), arg.then.jit(ctx));
            }

            return new __call_if { elifs = elifs.Select(ap).ToArray(), orelse = orelse?.jit(ctx) }.Invoke;
        }


    }

    public partial class While
    {

        public struct __call_while
        {
            public CPS cond;
            public CPS body; // can be null

            [MethodImpl(MethodImplOptions.AggressiveOptimization)]
            public DObj Invoke(ExecContext ctx)
            {

                while (true)
                {
                    var val_cond = cond(ctx);
                    if (ctx.CONT != 0)
                    {
                        return val_cond;
                    }
                    if (!val_cond.__bool__())
                        break;

                    var val_body = body(ctx);
                    if (ctx.CONT == 0)
                        continue;

                    if (ctx.CONT == (int)CONT.CONT)
                    {
                        ctx.CONT = 0;
                        continue;
                    }

                    if (ctx.CONT == (int)CONT.BREAK)
                    {
                        ctx.CONT = 0;
                        break;
                    }

                    // if (ctx.CONT == (int) CONT.RETURN)
                    return val_body;
                }
                return DNone.unique;
            }
        }
        public CPS jit_impl(MetaContext ctx)
        {
            return new __call_while { cond = cond.jit(ctx), body = then.jit(ctx) }.Invoke;
        }


    }


    public partial class Loop
    {

        public struct __call_loop
        {
            public CPS body; // can be null

            [MethodImpl(MethodImplOptions.AggressiveOptimization)]
            public DObj Invoke(ExecContext ctx)
            {

                while (true)
                {

                    var val_body = body(ctx);
                    if (ctx.CONT == 0)
                        continue;

                    if (ctx.CONT == (int)CONT.CONT)
                    {
                        ctx.CONT = 0;
                        continue;
                    }

                    if (ctx.CONT == (int)CONT.BREAK)
                    {
                        ctx.CONT = 0;
                        break;
                    }

                    // if (ctx.CONT == (int) CONT.RETURN)
                    return val_body;
                }
                return DNone.unique;
            }
        }
        public CPS jit_impl(MetaContext ctx)
        {
            return new __call_loop { body = body.jit(ctx) }.Invoke;
        }


    }



    public partial class For
    {
        public struct __for_local
        {
            public int localidx;
            public CPS iter;
            public CPS body; // can be null

            [MethodImpl(MethodImplOptions.AggressiveOptimization)]
            public DObj Invoke(ExecContext ctx)
            {
                var val_iter = iter(ctx);
                if (ctx.CONT != 0)
                    return val_iter;

                foreach (var e in val_iter.__iter__())
                {
                    ctx.localvars[localidx] = e;
                    var val_body = body(ctx);
                    if (ctx.CONT == 0)
                        continue;

                    if (ctx.CONT == (int)CONT.CONT)
                    {
                        ctx.CONT = 0;
                        continue;
                    }

                    if (ctx.CONT == (int)CONT.BREAK)
                    {
                        ctx.CONT = 0;
                        break;
                    }

                    // if (ctx.CONT == (int) CONT.RETURN)
                    return val_body;
                }
                return DNone.unique;
            }
        }

        public struct __for_free
        {
            public int freeidx;
            public CPS iter;
            public CPS body; // can be null

            [MethodImpl(MethodImplOptions.AggressiveOptimization)]
            public DObj Invoke(ExecContext ctx)
            {
                var val_iter = iter(ctx);
                if (ctx.CONT != 0)
                    return val_iter;

                foreach (var e in val_iter.__iter__())
                {
                    ctx.freevars[freeidx] = e;
                    var val_body = body(ctx);
                    if (ctx.CONT == 0)
                        continue;

                    if (ctx.CONT == (int)CONT.CONT)
                    {
                        ctx.CONT = 0;
                        continue;
                    }

                    if (ctx.CONT == (int)CONT.BREAK)
                    {
                        ctx.CONT = 0;
                        break;
                    }

                    // if (ctx.CONT == (int) CONT.RETURN)
                    return val_body;
                }
                return DNone.unique;
            }
        }
        public struct __for_global
        {
            public string name;
            public CPS iter;
            public CPS body; // can be null

            [MethodImpl(MethodImplOptions.AggressiveOptimization)]
            public DObj Invoke(ExecContext ctx)
            {
                var val_iter = iter(ctx);
                if (ctx.CONT != 0)
                    return val_iter;

                foreach (var e in val_iter.__iter__())
                {
                    ctx.ns[name] = e;
                    var val_body = body(ctx);
                    if (ctx.CONT == 0)
                        continue;

                    if (ctx.CONT == (int)CONT.CONT)
                    {
                        ctx.CONT = 0;
                        continue;
                    }

                    if (ctx.CONT == (int)CONT.BREAK)
                    {
                        ctx.CONT = 0;
                        break;
                    }

                    // if (ctx.CONT == (int) CONT.RETURN)
                    return val_body;
                }
                return DNone.unique;
            }
        }

        public CPS jit_impl(MetaContext ctx)
        {
            var cps_iter = iter.jit(ctx);
            var lhs = ctx.search(target);

            if (!lhs.HasValue)
            {
                return new __for_global { name = target, iter = cps_iter, body = body.jit(ctx) }.Invoke;
            }
            else if (lhs.Value >= 0)
            {
                return new __for_local { localidx = lhs.Value, iter = cps_iter, body = body.jit(ctx) }.Invoke;
            }
            else
            {
                return new __for_free { freeidx = -lhs.Value - 1, iter = cps_iter, body = body.jit(ctx) }.Invoke;
            }
        }



        public void __resolve_local(MetaContext ctx)
        {
            ctx.enter(target);
            body.__resolve_local(ctx);
        }
    }


    public partial class OGet
    {
        public struct __get
        {
            public CPS subject;
            public CPS item;

            public DObj Invoke(ExecContext ctx)
            {
                var val_subject = subject(ctx);
                if (ctx.CONT != 0)
                    return val_subject;
                var val_item = item(ctx);
                if (ctx.CONT != 0)
                    return val_item;
                return val_subject.__get__(val_item);
            }
        }
        public CPS jit_impl(MetaContext ctx) => new __get { subject = target.jit(ctx), item = item.jit(ctx) }.Invoke;

    }

    public partial class Block
    {
        public struct __block
        {
            public CPS[] suite;

            public DObj Invoke(ExecContext ctx)
            {
                DObj ret = DNone.unique;
                for (int i = 0; i < suite.Length; i++)
                {
                    ret = suite[i](ctx);
                    if (ctx.CONT != 0)
                        return ret;
                }
                return ret;
            }
        }
        public CPS jit_impl(MetaContext ctx) =>
            new __block
            {
                suite = suite
                    .Select(x => x.jit(ctx))
                    .Where(x => x != null)
                    .ToArray()
            }.Invoke;


    }


    public partial class Call
    {

        public struct __call
        {
            public CPS func;
            public CPS[] args;

            [MethodImpl(MethodImplOptions.AggressiveOptimization)]
            public DObj Invoke(ExecContext ctx)
            {

                var funcval = func(ctx);
                if (ctx.CONT != 0)
                    return funcval;
                var argvals = new DObj[args.Length];
                for (int i = 0; i < args.Length; i++)
                {
                    argvals[i] = args[i](ctx);
                    if (ctx.CONT != 0)
                        return argvals[i];
                }
                return funcval.__call__(argvals);
            }
        }

        public CPS jit_impl(MetaContext ctx) =>
            new __call
            {
                func = f.jit(ctx),
                args = args.Select(x => x.jit(ctx)).ToArray()
            }.Invoke;

    }

    public struct LocalNameBinder
    {
        int localidx;

        public LocalNameBinder(int localidx)
        {
            this.localidx = localidx;
        }

        public void Invoke(ExecContext ctx, DObj v)
        {
            ctx.localvars[localidx] = v;
        }
    }

    public struct GlobalNameBinder
    {
        string name;

        public GlobalNameBinder(string name)
        {
            this.name = name;
        }
        public void Invoke(ExecContext ctx, DObj v)
        {
            ctx.ns[name] = v;
        }
    }


    public struct FreeNameBinder
    {
        int freeidx;

        public FreeNameBinder(int freeidx)
        {
            this.freeidx = freeidx;
        }
        public void Invoke(ExecContext ctx, DObj v)
        {
            ctx.freevars[freeidx] = v;
        }
    }


    public partial class Function
    {
        public void __resolve_local(MetaContext ctx) { }

        static (EncodedVar, EncodedVar)[] emptyFreeTrans = new (EncodedVar, EncodedVar)[0];
        static DObj[] emptyFreeVars = new DObj[0];
        public struct __mk_func
        {
            public Action<ExecContext, DObj> nameBinder;
            public (EncodedVar, EncodedVar)[] freetrans;
            public CodeObject co;
            public CPS body;

            [MethodImpl(MethodImplOptions.AggressiveOptimization)]
            public DObj Invoke(ExecContext ctx)
            {
                var freevars = emptyFreeVars;
                if (freetrans.Length != 0)
                {
                    freevars = new DObj[freetrans.Length];
                    foreach (var (from, to) in freetrans)
                    {
                        freevars[to] = from >= 0 ? ctx.localvars[from] : ctx.freevars[-from - 1];
                    }
                }
                var func = new DStaticFunc { ns = ctx.ns, freevars = freevars, co = co, body = body };
                nameBinder?.Invoke(ctx, func);
                return func;
            }
        }
        public CPS jit_impl(MetaContext ctx)
        {
            var name_ind = ctx.search(name);
            var name_str = name;
            var subctx_dict = new Dictionary<string, int>();
            var subctx = MetaContext.Create(ctx, subctx_dict);

            for (var i = 0; i < args.Length; i++)
            {
                if (subctx_dict.ContainsKey(args[i]))
                {
                    // TODO: track and position compile time exceptions.

                    throw new LocatedError(
                        new NameError(
                        $"duplicate argument {args[i]} for function '{name}'"),
                        "compiling",
                        ctx.currentPos);
                }

                subctx_dict[args[i]] = i;
            }

            subctx.nlocal = args.Length;
            var currentPos = ctx.currentPos;
            body.__resolve_local(subctx);

            var cps_body = body.jit(subctx);

            var bind_scope = true;

            if (name_str == "")
            {
                name_str = "<lambda>";
                bind_scope = false;
            }

            Action<ExecContext, DObj> nameBinder =
                !(bind_scope)
                ? null
                : !(name_ind.HasValue)
                  ? new GlobalNameBinder(name_str).Invoke
                  : (name_ind.Value >= 0)
                    ? new LocalNameBinder(name_ind.Value).Invoke
                    : new FreeNameBinder(-name_ind.Value - 1).Invoke
                    ;

            var (freetrans, code) = subctx.jitCode(currentPos, args, name_str);

            return new __mk_func
            {
                nameBinder = nameBinder,
                body = cps_body,
                freetrans = freetrans,
                co = code
            }.Invoke;

        }

    }

    public partial class CVal
    {
        public struct __val_load_i
        {
            public DInt i;

            public DObj Invoke(ExecContext ctx)
            {
                return i;
            }
        }

        public struct __val_load_none
        {
            public DObj Invoke(ExecContext ctx)
            {
                return DNone.unique;
            }
        }

        public struct __val_load_f
        {
            public DFloat f;
            public DObj Invoke(ExecContext ctx)
            {
                return f;
            }
        }

        public struct __val_load_s
        {
            public DString s;
            public DObj Invoke(ExecContext ctx)
            {
                return s;
            }
        }

        public CPS jit_impl(MetaContext ctx)
        {
            switch (obj)
            {
                case DInt i: return new __val_load_i { i = i }.Invoke;
                case DFloat f: return new __val_load_f { f = f }.Invoke;
                case DString s: return new __val_load_s { s = s }.Invoke;
                case DNone: return new __val_load_none { }.Invoke;
                default:
                    throw new TypeError($"unknown constant object {obj.__repr__()}");
            }
        }

    }

    public partial class CList
    {

        public struct __build_list
        {
            public CPS[] elts;

            public DObj Invoke(ExecContext ctx)
            {
                var ret = new List<DObj>();
                for (int i = 0; i < elts.Length; i++)
                {
                    var elt = elts[i](ctx);
                    if (ctx.CONT != 0)
                        return elt;
                    ret.Add(elt);
                }
                return MK.List(ret);
            }
        }

        public CPS jit_impl(MetaContext ctx) =>
            new __build_list
            {
                elts = elts.Select(x => x.jit(ctx)).ToArray()
            }.Invoke;

    }

    public partial class CTuple
    {
        public struct __build_tuple
        {
            public CPS[] elts;

            public DObj Invoke(ExecContext ctx)
            {
                var ret = new DObj[elts.Length];
                for (int i = 0; i < elts.Length; i++)
                {
                    var elt = elts[i](ctx);
                    if (ctx.CONT != 0)
                        return elt;
                    ret[i] = elt;
                }
                return MK.Tuple(ret);
            }
        }

        public CPS jit_impl(MetaContext ctx) =>
            new __build_tuple
            {
                elts = elts.Select(x => x.jit(ctx)).ToArray()
            }.Invoke;


    }

    public partial class CDict
    {
        public struct __build_dict
        {
            public (CPS, CPS)[] pairs;

            public DObj Invoke(ExecContext ctx)
            {
                var ret = new Dictionary<DObj, DObj>();
                for (int i = 0; i < pairs.Length; i++)
                {
                    var (key, value) = pairs[i];
                    var val_key = key(ctx);
                    if (ctx.CONT != 0)
                        return val_key;
                    var val_value = value(ctx);
                    if (ctx.CONT != 0)
                        return val_value;
                    ret[val_key] = val_value;
                }
                return MK.Dict(ret);
            }
        }

        public CPS jit_impl(MetaContext ctx) =>
            new __build_dict
            {
                pairs = pairs.Select(x => (x.Item1.jit(ctx), x.Item2.jit(ctx))).ToArray()
            }.Invoke;


    }

    public partial class CSet
    {

        public struct __build_set
        {
            public CPS[] elts;

            public DObj Invoke(ExecContext ctx)
            {
                var ret = new Dictionary<DObj, DObj>();
                for (int i = 0; i < elts.Length; i++)
                {
                    var elt = elts[i](ctx);
                    if (ctx.CONT != 0)
                        return elt;
                    ret[elt] = DNone.unique;
                }
                return MK.Dict(ret);
            }
        }

        public CPS jit_impl(MetaContext ctx) =>
            new __build_set
            {
                elts = elts.Select(x => x.jit(ctx)).ToArray()
            }.Invoke;


    }


    public partial class And
    {

        public struct __build_and
        {
            public CPS left;
            public CPS right;

            public DObj Invoke(ExecContext ctx)
            {
                var val_left = left(ctx);
                if (ctx.CONT != 0 || !val_left.__bool__())
                    return val_left;
                return right(ctx);
            }
        }

        public CPS jit_impl(MetaContext ctx) =>
            new __build_and
            {
                left = left.jit(ctx),
                right = right.jit(ctx)
            }.Invoke;


    }

    public partial class Or
    {
        public struct __build_or
        {
            public CPS left;
            public CPS right;

            public DObj Invoke(ExecContext ctx)
            {
                var val_left = left(ctx);
                if ((ctx.CONT != 0) || val_left.__bool__())
                    return val_left;
                return right(ctx);
            }
        }

        public CPS jit_impl(MetaContext ctx)
        {
            return new __build_or
            {
                left = left.jit(ctx),
                right = right.jit(ctx)
            }.Invoke;
        }

    }


    public partial class Not
    {
        public struct __build_not
        {
            public CPS inner;
            public DObj Invoke(ExecContext ctx)
            {
                var val = inner(ctx);
                if (ctx.CONT != 0)
                    return val;
                return val.__bool__() ? MK.Zero : MK.One;
            }
        }

        public CPS jit_impl(MetaContext ctx) =>
            new __build_not
            {
                inner = value.jit(ctx)
            }.Invoke;

    }

    public partial class Neg
    {
        public struct __build_neg
        {
            public CPS inner;
            public DObj Invoke(ExecContext ctx)
            {
                var val = inner(ctx);
                if (ctx.CONT != 0)
                    return val;
                return val.__neg__();
            }
        }

        public CPS jit_impl(MetaContext ctx) =>
            new __build_neg
            {
                inner = value.jit(ctx)
            }.Invoke;

    }

    public partial class Inv
    {
        public struct __build_inv
        {
            public CPS inner;
            public DObj Invoke(ExecContext ctx)
            {
                var val = inner(ctx);
                if (ctx.CONT != 0)
                    return val;
                return val.__inv__();
            }
        }

        public CPS jit_impl(MetaContext ctx) =>
            new __build_inv
            {
                inner = value.jit(ctx)
            }.Invoke;

    }

    public partial class Decl
    {
        public void __resolve_local(MetaContext ctx)
        {
            foreach (var name in names)
            {
                ctx.enter(name);
            }
        }

        public CPS jit_impl(MetaContext _) => null;
    }

    public partial class Return
    {

        public struct __return_some
        {
            public CPS inner;
            public DObj Invoke(ExecContext ctx)
            {
                var val = inner(ctx);
                if (ctx.CONT == 0)
                {
                    ctx.CONT = (int)CONT.RETURN;
                }
                return val;
            }
        }

        public struct __return_none
        {
            public DObj Invoke(ExecContext ctx)
            {
                ctx.CONT = (int)CONT.RETURN;
                return DNone.unique;
            }
        }

        public CPS jit_impl(MetaContext ctx) =>
            value == null
            ? new __return_none { }.Invoke
            : new __return_some { inner = value.jit(ctx) }.Invoke;

    }

    public partial class Continue
    {

        public CPS jit_impl(MetaContext ctx) =>
            new __cont { }.Invoke;

        public struct __cont
        {
            public DObj Invoke(ExecContext ctx)
            {

                ctx.CONT = (int)CONT.CONT;
                return DNone.unique;
            }
        }
    }

    public partial class Break
    {
        public CPS jit_impl(MetaContext ctx) =>
            new __break { }.Invoke;

        public struct __break
        {
            public DObj Invoke(ExecContext ctx)
            {

                ctx.CONT = (int)CONT.BREAK;
                return DNone.unique;
            }
        }
    }
}