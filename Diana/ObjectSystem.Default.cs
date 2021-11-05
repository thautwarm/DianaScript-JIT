using System;
using System.Collections.Generic;
using System.Linq;


namespace Diana
{
    public interface DObj : IEquatable<DObj>
    {
        bool IEquatable<DObj>.Equals(DObj other)
        {
            return __eq__(other);
        }
        public bool __bool__() => true;
        public object Native => this;
        public string Classname => this.GetType().Name;
        public string __str__() => Native.ToString();
        public string __repr__() => __str__();
        public DObj __next__() => throw unsupported_op(this, "__next__");
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

        public DObj __call0__()
        {
            return __call__();
        }

        public DObj __call1__(DObj o)
        {
            return __call__(o);
        }

        public DObj __call2__(DObj arg1, DObj arg2)
        {
            return __call__(arg1, arg2);
        }

        public bool __contains__(DObj a)
        {
            throw unsupported_op(this, "__contains__");
        }

        public bool __eq__(DObj o)
        {
            return Object.ReferenceEquals(o.Native, this.Native);
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

    public class DModule : DObj
    {

        public Dictionary<string, DObj> fields;
        public string name;
        public string Classname => "module";

        public DModule(string name)
        {
            fields = new Dictionary<string, DObj>();
            this.name = name;
        }

        public string __str__() => name;

        public DObj __getstr__(string field)
        {
            if(fields.TryGetValue(field, out var obj))
            {
                return obj;
            }
            throw new AttributeError($"module {name} has no attribute {field}.");
        }
        public DObj __get__(DObj s)
        {
            var field = (s as DString)?.value;
            if (field == null)
                throw new TypeError($"a module field should be string.");
            return __getstr__(field);
        }
    }

    public partial class DIterable : DObj
    {
        public string __str__() => $"<{module_instance.name}>";
        public Dictionary<string, DObj> fields;

        public IEnumerable<DObj> iter;
        public DIterable(IEnumerable<DObj> iter)
        {
            this.iter = iter;
        }
        public IEnumerable<DObj> __iter__() => iter;
    }
}