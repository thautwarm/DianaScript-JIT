using System;
using System.Collections.Generic;
using System.Linq;
using int_t = System.Int64;

namespace Ava
{
    public struct THint<A>
    {
        public static THint<A> val;
    }


    public static class MK
    {   

        //public static B unbox<A, B>(THint<B> _, A o) where B : A => (B)o;

        public static DObj unbox(THint<DObj> _, DObj o) => o;

        public static Ref unbox(THint<Ref> _, DObj o) => (Ref) o;

        public static Dictionary<DObj, DObj> unbox(THint<Dictionary<DObj, DObj>> _, DObj o) => ((DDict) o).dict;
        public static DObj[] unbox(THint<DObj[]> _, DObj o) => ((DTuple) o).elts;
        public static List<DObj> unbox(THint<List<DObj>> _, DObj o) => ((DList) o).elts;

        public static Predicate<DObj> unbox(THint<Predicate<DObj>> _, DObj o)
        {
            var f = ((DFunc) o).func;
            return (arg) => f(new []{arg}).__bool__();
        }
        public static A unbox<A>(THint<A> _, DObj a) where A : DObj => (A) a;
        public static int unbox(THint<int> _, DObj a) => (int) a.Native;
        public static long unbox(THint<long> _, DObj a) => (long) a.Native;
        public static  ulong unbox(THint<ulong> _, DObj a) => (ulong) a.Native;
        public static uint unbox(THint<uint> _, DObj a) => (uint) a.Native;
        public static byte unbox(THint<byte> _, DObj a) => (byte) a.Native;

        public static float unbox(THint<float> _, DObj a) => (float) a.Native;
        public static string unbox(THint<string> _, DObj a) => (string) a.Native;
        
        public static A unbox<A, B>(THint<A> _, B o) where B: A => o;

        public static DObj cast(THint<DObj> _, DObj o) => o;
        public static B cast<A, B>(THint<B> _, A o) where A : B => o;
        public static A cast<A, B>(THint<A> _, B o) where A : B => (A)o;
        public static DObj cast<A>(THint<DObj> _, A o) => create(o);
        public static Char[] cast(THint<Char[]> _, String s) => s.ToCharArray();
        public static String cast(THint<String> _, Char[] s) => new String(s);
        public static String cast(THint<Char> _, Char s) => new String(new[] { s });
        public static String cast(THint<String> _, DObj a) => a.__str__();
        public static String[] cast(THint<String[]> _, DObj a) => 
            a.__iter__().Select(x => x.__str__()).ToArray();
    

         public static float cast(THint<float> _, int s) => s;
        public static int cast(THint<int> _, float s) => (int)s;
        public static float cast(THint<float> _, long s) => s;
        public static long cast(THint<long> _, float s) => (int)s;

        public static uint cast(THint<uint> _, int_t s) => unchecked((uint)s);
        public static ulong cast(THint<ulong> _, int_t s) => unchecked((ulong)s);

        public static IEnumerable<DObj> cast(THint<IEnumerable<DObj>> _, DObj s) => s.__iter__();
        public static bool cast(THint<bool> _, DObj s) => s.__bool__();
        public static A cast<A>(THint<A> _, A s) => s;


        public static DObj create(int s) => Int(s);
        public static DObj create(bool s) => Int(s);
        public static DObj create(long s) => Int(s);
        public static DObj create(ulong s) => Int(s);
        public static DObj create(uint s) => Int(s);

        public static DInt Int(int i) => new DInt {value = i};
        public static DInt Int(bool i) => new DInt {value = i ? 1 : 0};
        public static DInt Int(long i) => new DInt {value = i};
        public static DInt Int(ulong i) => new DInt {value = (int_t) i};
        public static DInt Int(uint i) => new DInt {value = (int_t) i};


        public static DObj create(float s) => Float(s);
        public static DFloat Float(float f) => new DFloat {value = f};


        public static DString String(string f) => new DString {value = f};



        public static DObj create() => None();
        public static DNone None() => DNone.unique;



        public static DObj create(List<DObj> d) => List(d);
        public static DObj List(List<DObj> dObjs)
        {
            return new DList {elts = dObjs};
        }



        public static DObj create(DObj[] d) => Tuple(d);
        public static DObj Tuple(DObj[] dObjs)
        {
            return new DTuple {elts = dObjs};
        }

        public static DObj create(object d) => new DNative { value = d };

        public static DObj create(Dictionary<DObj, DObj> d) => Dict(d);

        public static DObj Dict(Dictionary<DObj, DObj> dObjs)
        {
            return new DDict {dict = dObjs};
        }

        public static DObj StrDict(Dictionary<string, DObj> dObjs)
        {
            return new DStrDict {dict = dObjs};
        }

        public static DObj create(Dictionary<string, DObj> d) => StrDict(d);

        public static DFunc Func0(string name, Func<DObj> f)
        {
            DObj call(DObj[] _)
            {
                return f();
            }

            return new DFunc {func = call, name = name};
        }

        public static DFunc Func1(string name, Func<DObj, DObj> f)
        {
            DObj call(DObj[] args)
            {
                if (args.Length < 1)
                    throw new ArgumentException($"{name} requires more than 1 arguments.");
                return f(args[0]);
            }

            return new DFunc {func = call, name = name};
        }

        public static DFunc Func2(string name, Func<DObj, DObj, DObj> f)
        {
            DObj call(DObj[] args)
            {
                if (args.Length < 2)
                    throw new ArgumentException($"{name} requires more than 2 arguments.");
                return f(args[0], args[1]);
            }

            return new DFunc {func = call, name = name};
        }

        public static DFunc FuncN(string name, Func<DObj[], DObj> f)
        {
            return new DFunc {func = f, name = name};
        }

        public static DTuple tuple(params DObj[] args)
        {
            return new DTuple {elts = args};
        }
    }
}