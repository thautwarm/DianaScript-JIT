using System;
using System.Linq;
using System.Collections.Generic;

namespace Ava
{
    public class DianaVMError : Exception
    {
        public List<(int, int, string)> frames;
        public Exception e;

        public string filename;

        public DianaVMError(Exception e, string filename, List<(int, int, string)> frames) : base(
            e.GetType().ToString() + ": " + e.Message)
        {
            this.e = e;
            this.frames = frames;
            this.filename = filename;
        }

        public override string StackTrace => get_stack_trace();

        string get_stack_trace()
        {
            return
#if MY_DEBUG
        e.StackTrace + "\n\n" +
#endif
                "DianaVM exception not handled:\n" +
                String.Concat(
                    this.frames.Select(frame =>
                    {
                        var (l, c, msg) = frame;
                        return $"  {msg} at {filename}:{l}:{c}\n";
                    }).ToArray()
                );
        }
    }

    public class NameError : Exception
    {
        public NameError(string s) : base(s)
        {
        }
    }

    public class AssertionError : Exception
    {
        public AssertionError(string s) : base(s)
        {
        }
    }
}