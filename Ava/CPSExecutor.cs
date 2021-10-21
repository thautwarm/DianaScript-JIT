using System;
using System.Collections.Generic;

namespace Ava
{
    using ExecType = Func<ExecContext, DObj>;

    public static class CPSExecutor
    {
        public static DObj Exec(
            Dictionary<string, DObj> globals,
            ExecType cps,
            string filename
        )
        {
            var frames = new List<(int, int, string)>();
            var exec_ctx = ExecContext.ofGlobals(globals, frames: frames);

            try
            {
                return cps(exec_ctx);
            }
            catch (Exception e)
            {
                throw new DianaVMError(e, filename, frames);
            }
        }
    }
}