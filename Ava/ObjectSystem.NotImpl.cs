using System;
using System.Collections.Generic;
using System.Linq;


namespace Ava
{
    public interface DObj : IEquatable<DObj>
    {
        bool IEquatable<DObj>.Equals(DObj other)
        {
            return __eq__(other);
        }

        public bool __bool__() => true;
        public object Native { get; }
        public string Classname { get; }
        public string __str__() => Native.ToString();
        public string __repr__() => __str__();

        static Exception unsupported_op(DObj a, string op) =>
            new TypeError($"{a.Classname} does not support '{op}'");
        public DObj __add__(DObj a)
        {
            throw unsupported_op(this, "+");
        }

        public DObj __bitand__(DObj a)
        {
            throw unsupported_op(this, "&");
        }

        public DObj __bitor__(DObj a)
        {
            throw unsupported_op(this, "|");
        }

        public DObj __bitxor__(DObj a)
        {
            throw unsupported_op(this, "^");
        }

        public DObj __call__(params DObj[] objs)
        {
            throw unsupported_op(this, "__call__");
        }

        public bool __contains__(DObj a)
        {
            throw unsupported_op(this, "__contains__");
        }

        public bool __eq__(DObj o)
        {
            throw unsupported_op(this, "==");
        }

        public DObj __floordiv__(DObj a)
        {
            throw unsupported_op(this, "//");
        }

        public DObj __get__(DObj s)
        {
            throw unsupported_op(this, "__get__");
        }

        public void __set__(DObj s, DObj value)
        {
            throw unsupported_op(this, "__set__");
        }

        public DObj __inv__()
        {
            throw unsupported_op(this, "__inv__");
        }

        public IEnumerable<DObj> __iter__()
        {
            throw unsupported_op(this, "__iter__");
        }

        public int __len__()
        {
            throw unsupported_op(this, "__len__");
        }

        public DObj __lshift__(DObj a)
        {
            throw unsupported_op(this, "<<");
        }

        public bool __lt__(DObj o)
        {
            throw unsupported_op(this, "<");
        }

        public DObj __mod__(DObj a)
        {
            throw unsupported_op(this, "%");
        }

        public DObj __mul__(DObj a)
        {
            throw unsupported_op(this, "*");
        }

        public DObj __neg__()
        {
            throw unsupported_op(this, "__neg__");
        }

        public DObj __pow__(DObj a)
        {
            throw unsupported_op(this, "**");
        }

        public DObj __rshift__(DObj a)
        {
            throw unsupported_op(this, ">>");
        }

        public DObj __sub__(DObj a)
        {
            throw unsupported_op(this, "-");
        }

        public DObj __truediv__(DObj a)
        {
            throw unsupported_op(this, "/");
        }
    }

    
}