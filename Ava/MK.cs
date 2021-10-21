using System;
using System.Collections.Generic;
using int_t = System.Int64;

namespace Ava
{
    public static class MK
    {
        public static DInt Int(int i) => new DInt { value = i };
        public static DInt Int(bool i) => new DInt { value = i ? 1 : 0 };
        public static DInt Int(long i) => new DInt { value = i };
        public static DInt Int(ulong i) => new DInt { value = (int_t)i };
        public static DInt Int(uint i) => new DInt { value = (int_t)i };

        public static DFloat Float(float f) => new DFloat { value = f };

        public static DString String(string f) => new DString { value = f };


        public static DNone None() => DNone.unique;

        public static DObj List(List<DObj> dObjs)
        {
            return new DList { elts = dObjs };
        }

        public static DObj Tuple(DObj[] dObjs)
        {
            return new DTuple { elts = dObjs };
        }
        public static DObj Dict(Dictionary<DObj, DObj> dObjs)
        {
            return new DDict { dict = dObjs };
        }

        public static DFunc Func0(string name, Func<DObj> f)
        {
            DObj call(DObj[] _)
            {
                return f();
            }
            return new DFunc { func = call, name = name };
        }

        public static DFunc Func1(string name, Func<DObj, DObj> f)
        {
            DObj call(DObj[] args)
            {
                return f(args[0]);
            }
            return new DFunc { func = call, name = name };
        }

        public static DFunc Func2(string name, Func<DObj, DObj, DObj> f)
        {
            DObj call(DObj[] args)
            {
                return f(args[0], args[1]);
            }
            return new DFunc { func = call, name = name };
        }

        public static DFunc FuncN(string name, Func<DObj[], DObj> f)
        {
            return new DFunc { func = f, name = name };
        }
    }
}