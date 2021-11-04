using System;
using System.Collections.Generic;
namespace Ava
{
    using NameSpace = Dictionary<string, DObj>;
    using CPS = Func<ExecContext, DObj>;
    public partial class DStaticFunc : DObj
    {
        public NameSpace ns;
        public DObj[] freevars;
        public CodeObject co;
        public CPS body;
        public DObj __call__(params DObj[] args)
        {
            if (args.Length < co.narg)
            {
                throw new ArgumentException($"function {co.name} requires at least {co.narg} argument(s), got {args.Length}.");
            }
            var localvars = new DObj[co.nlocal];
            args.CopyTo(localvars, 0);
            var ctx = new ExecContext(0, localvars, freevars, ns, co);
            return body(ctx);
        }
    }
}