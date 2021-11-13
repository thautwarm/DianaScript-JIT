using System;

namespace Diana
{
    [Metagen.Converter]
    public static class BuiltinConverters
    {
        [Metagen.Converter]
        public static int object_to_int(DObj o)
        {
            return (int) ((DInt) o).value;
        }

        [Metagen.Converter]
        public static long object_to_long(DObj o)
        {
            return ((DInt) o).value;
        }

        [Metagen.Converter]
        public static bool object_to_bool(DObj o)
        {
            return ((DInt) o).value != 0;
        }

        [Metagen.Converter]
        public static DObj bool_to_object(bool b)
        {
            return MK.Int(b);
        }

        [Metagen.Converter]
        public static DObj int_to_object(int i)
        {
            return MK.Int(i);
        }

        [Metagen.Converter]
        public static DObj long_to_object(long i)
        {
            return MK.Int(i);
        }

        [Metagen.Converter]
        public static DObj string_to_object(string s)
        {
            return MK.String(s);
        }

        [Metagen.Converter]
        public static string object_to_string(DObj o)
        {
            return (string) (DString) o;
        }

        [Metagen.Converter]
        public static float object_to_float(DObj o)
        {
            return (float) (DFloat) o;
        }

        [Metagen.Converter]
        public static DObj float_to_object(float f)
        {
            return MK.Float(f);
        }

        [Metagen.Converter]
        public static DObj double_to_object(double f)
        {
            return MK.Float((float) f);
        }

        [Metagen.Converter]
        public static double object_to_double(DObj o)
        {
            return (double) ((DFloat) o).value;
        }
    }
}