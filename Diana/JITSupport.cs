using System;
using System.Linq;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace Diana
{

    using NameSpace = Dictionary<string, DObj>;
    using CPS = Func<ExecContext, DObj>;

    public class Variable
    {
        public DObj obj;
    }
    public class ExecContext
    {
        public int CONT;
        public Variable[] localvars;
        public Variable[] freevars;
        public NameSpace ns;
        public Metadata co;

        static Variable[] emptyVariableArray = new Variable[0];
        public static DObj ExecTopLevel(CPS cps, NameSpace ns, Metadata co)
        {
            return cps(new ExecContext(emptyVariableArray, emptyVariableArray, ns, co));
        }

        public ExecContext(Variable[] localvars, Variable[] freevars, NameSpace ns, Metadata co)
        {
            this.CONT = 0;
            this.localvars = localvars;
            this.freevars = freevars;
            this.ns = ns;
            this.co = co;
        }

        [MethodImpl(MethodImplOptionsCompat.AggressiveInlining | MethodImplOptionsCompat.AggressiveOptimization)]
        public DObj loadGlobal(string n)
        {
            if (ns.TryGetValue(n, out var obj))
            {
                return obj;
            }
            throw new NameError("global", n);
        }

        [MethodImpl(MethodImplOptionsCompat.AggressiveInlining | MethodImplOptionsCompat.AggressiveOptimization)]
        public DObj loadLocal(int i)
        {
            DObj obj;
            if ((obj = localvars[i].obj) != null)
            {
                return obj;
            }
            throw new NameError("local", co.localnames[i]);
        }

        [MethodImpl(MethodImplOptionsCompat.AggressiveInlining | MethodImplOptionsCompat.AggressiveOptimization)]
        public DObj loadFree(int i)
        {
            DObj obj;
            if ((obj = freevars[i].obj) != null)
            {
                return obj;
            }
            throw new NameError("free", co.freenames[i]);
        }
    }

    [Serializable]
    [ImmutableObject(true)]
    public class SourcePos
    {
        public int line;
        public int col;
        public string filename;
        public SourcePos(int l, int c, string f)
        {
            line = l;
            col = c;
            filename = f;
        }
        public void visit(MetaContext ctx)
        {
            var p = ctx.currentPos;
            if (p.line == line && p.col == col && p.filename == filename)
                return;
            ctx.currentPos = this;
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

        public static int getFuncIdx(string n)
        {
            return indices[n];
        }

        public static Func<DObj, DObj, DObj> getFunc(string n)
        {
            return funcs[indices[n]];
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

    [Serializable]
    public sealed record Metadata(
        int narg,
        int nlocal,
        SourcePos pos,
        string name,
        string[] localnames,
        string[] freenames
        ) : DObj
    {
        public object Native => this;
        public string Classname => "code";

        public string __str__() => $"<codeobj {name}>";

        public bool __eq__(DObj o)
        {
            return (o is Metadata code) && code == this;
        }
    }
}