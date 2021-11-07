using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace Diana
{
    using NameSpace = Dictionary<string, DObj>;
    using CPS = Func<ExecContext, DObj>;
    public partial class DStaticFunc : DObj
    {
        public NameSpace ns;
        public Variable[] freevars;
        public Metadata co;
        public CPS body;

        [MethodImpl(MethodImplOptions.AggressiveOptimization | MethodImplOptions.AggressiveInlining)]
        public DObj __call__(params DObj[] args)
        {
            if (args.Length < co.narg)
            {
                throw new ArgumentException($"function {co.name} requires at least {co.narg} argument(s), got {args.Length}.");
            }
            Variable[] localvars;
            localvars = new Variable[co.nlocal];
            for(int i = 0; i < args.Length; i++)
            {
                localvars[i] = new Variable { obj = args[i] };
            }
            for(int i = args.Length; i < co.nlocal; i++)
            {
                localvars[i] = new Variable { obj = null };
            }
            var ctx = new ExecContext(localvars, freevars, ns, co);
            return body(ctx);
        }
    }
}