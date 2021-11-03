using System;
using System.Linq;
using System.Collections.Generic;

namespace Ava
{
    public class DianaVMError : Exception
    {
        public Exception e;

        public SourcePos pos;

        public DianaVMError(Exception e, SourcePos pos) : base()
        {
            this.e = e;
            this.pos = pos;
        }


        public override string StackTrace => get_stack_trace();

        string get_stack_trace()
        {
            return $"DianaVM exception not handled at {pos.filename}:{pos.line}:{pos.col}\n\n" + e.StackTrace;
        }
    }

    public class NameError : Exception
    {
        public NameError(string s) : base(s)
        {
        }

        public NameError(string kind, string s) : base($"{kind} variable {s} not found")
        {
        }
    }

    public class AttributeError : Exception
    {
        public AttributeError(string s) : base(s)
        {
        }
    }

    public class ValueError : Exception
    {
        public ValueError(string s) : base(s)
        {
        }
    }

    public class TypeError: Exception
    {
        public TypeError(string s) : base(s)
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