using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;


namespace Ava
{
    using int_t = System.Int64;
    using uint_t = System.UInt64;

    public interface DObj : IEquatable<DObj>
    {
        public string Classname { get; }
        public bool __bool__();
        public bool __eq__(DObj o);
        public bool __lt__(DObj o);
        public DObj __call__(DObj[] objs);
        public DObj __get__(DObj s);
        public void __set__(DObj s, DObj value);
        public DObj __add__(DObj a);
        public DObj __sub__(DObj a);
        public DObj __mul__(DObj a);
        public DObj __floordiv__(DObj a);
        public DObj __truediv__(DObj a);
        public DObj __pow__(DObj a);
        public DObj __mod__(DObj a);
        public DObj __lshift__(DObj a);
        public DObj __rshift__(DObj a);
        public DObj __bitand__(DObj a);
        public DObj __bitor__(DObj a);
        public DObj __bitxor__(DObj a);
        public bool __contains__(DObj a);
        public DObj __neg__();
        public DObj __inv__();
        public string __str__();
        public IEnumerable<DObj> __iter__();
    }

    public partial struct DInt : DObj
    {
        public Int64 value;

        public string __str__() => value.ToString();
        public string Classname => "int";

        public bool Equals(DObj other)
        {
            return this.__eq__(other);
        }

        public bool __bool__()
        {
            return value != 0;
        }

        public DObj __inv__()
        {
            return MK.Int(~value);
        }


        public DObj __neg__()
        {
            return MK.Int(-value);
        }
    }

    public partial struct DFloat : DObj
    {
        public string __str__() => value.ToString();
        public string Classname => "float";

        public bool Equals(DObj other)
        {
            return this.__eq__(other);
        }

        public float value;


        public DObj __neg__()
        {
            return MK.Float(-value);
        }

        public bool __bool__()
        {
            return value != 0;
        }


        public bool __eq__(DObj o)
        {
            if (o is DInt i)
            {
                return value == i.value;
            }
            else if (o is DFloat f)
            {
                return value == f.value;
            }

            throw new NotImplementedException();
        }

        public bool __lt__(DObj o)
        {
            if (o is DInt i)
            {
                return value < i.value;
            }
            else if (o is DFloat f)
            {
                return value < f.value;
            }

            throw new NotImplementedException();
        }
    }

    public partial struct DNone : DObj
    {
        public string __str__() => "None";
        public string Classname => "none";

        public bool Equals(DObj other)
        {
            return this.__eq__(other);
        }

        public static DNone unique;

        public bool __bool__()
        {
            return false;
        }

        public bool __eq__(DObj o)
        {
            return (o is DNone);
        }
    }

    public partial struct DString : DObj
    {
        public string __str__() => value;
        public string Classname => "str";
        public string value;

        public bool __bool__()
        {
            return value != "";
        }


        public bool __eq__(DObj o)
        {
            return (o is DString a) && a.value == value;
        }

        public bool Equals(DObj other)
        {
            return this.__eq__(other);
        }

        public bool __contains__(DObj a)
        {
            if (a is DString o)
                return value.Contains(o.value);
            throw new NotImplementedException();
        }

        public DObj __add__(DObj other)
        {
            return MK.String(value + other.__str__());
        }

        public IEnumerable<DObj> __iter__()
        {
            foreach (var c in value)
            {
                yield return MK.String(new String(new char[] {c}));
            }
        }
    }


    public partial class DDict : DObj
    {
        public string __str__()
        {
            return "{" + String.Join(", ", dict.Select(x =>
                $"{x.Key.__str__()}: {x.Value.__str__()}")) + "}";
        }

        public string Classname => "dict";
        public Dictionary<DObj, DObj> dict;


        public bool __bool__()
        {
            return dict.Count != 0;
        }


        public bool __eq__(DObj o)
        {
            return (o is DDict a) && a.dict.Count == dict.Count && !dict.Except(a.dict).Any();
        }

        public DObj __get__(DObj s)
        {
            return dict[s];
        }


        public void __set__(DObj s, DObj value)
        {
            dict[s] = value;
        }

        public bool Equals(DObj other)
        {
            return this.__eq__(other);
        }


        public bool __contains__(DObj a)
        {
            return dict.ContainsKey(a);
        }

        public IEnumerable<DObj> __iter__()
        {
            foreach (var obj in dict)
            {
                yield return MK.Tuple(new[] {obj.Key, obj.Value});
            }
        }
    }


    public partial class DTuple : DObj
    {
        public string __str__()
        {
            return "(" + String.Join(",", elts.Select(x => x.__str__())) + ",)";
        }

        public string Classname => "tuple";
        public DObj[] elts;

        public bool __bool__()
        {
            return elts.Length != 0;
        }

        public bool __eq__(DObj o)
        {
            return (o is DTuple a) && a.elts.Length == elts.Length && a.elts.SequenceEqual(elts);
        }


        public bool Equals(DObj other)
        {
            return this.__eq__(other);
        }

        public DObj __get__(DObj s)
        {
            if (s is DInt i)
            {
                return elts[(int) i.value];
            }

            throw new NotImplementedException();
        }

        public bool __lt__(DObj o)
        {
            if (o is DTuple a)
            {
                for (int i = 0; i < elts.Length; i++)
                {
                    if (i == a.elts.Length)
                    {
                        return false;
                    }
                    else if (elts[i].__lt__(a.elts[i]))
                    {
                        continue;
                    }
                    else
                    {
                        return false;
                    }
                }

                return true;
            }

            throw new NotFiniteNumberException();
        }

        public DObj __add__(DObj a)
        {
            if (a is DList b)
            {
                return MK.Tuple(elts.Concat(b.elts).ToArray());
            }

            throw new NotFiniteNumberException();
        }

        public bool __contains__(DObj a)
        {
            return elts.Contains(a);
        }

        public IEnumerable<DObj> __iter__()
        {
            return elts;
        }
    }

    public partial class DList : DObj
    {
        public string __str__()
        {
            return "[" + String.Join(",", elts.Select(x => x.__str__())) + "]";
        }

        public string Classname => "list";
        public List<DObj> elts;

        public bool __bool__()
        {
            return elts.Count != 0;
        }


        public bool __eq__(DObj o)
        {
            return (o is DList a) && a.elts.Count == elts.Count && a.elts.SequenceEqual(elts);
        }

        public DObj __get__(DObj s)
        {
            if (s is DInt i)
            {
                return elts[(int) i.value];
            }

            throw new NotImplementedException();
        }


        public void __set__(DObj s, DObj value)
        {
            if (s is DInt i)
            {
                elts[(int) i.value] = value;
            }

            throw new NotImplementedException();
        }

        public bool Equals(DObj other)
        {
            return this.__eq__(other);
        }

        public DObj __add__(DObj a)
        {
            if (a is DList b)
            {
                return MK.List(elts.Concat(b.elts).ToList());
            }

            throw new NotImplementedException();
        }


        public bool __contains__(DObj a)
        {
            return elts.Contains(a);
        }

        public IEnumerable<DObj> __iter__()
        {
            return elts;
        }
    }

    public partial class DNative : DObj
    {
        public object value;

        public string Classname => "native";


        public string __str__()
        {
            return value.ToString();
        }
    }

    public partial class DFunc : DObj
    {
        public string __str__()
        {
            return name;
        }

        public Func<DObj[], DObj> func;

        public string name;
        public string Classname => "function";


        public DObj __call__(DObj[] args) => func(args);

        public bool __bool__()
        {
            return true;
        }

        public bool __eq__(DObj o)
        {
            return ReferenceEquals(this, o);
        }


        public bool Equals(DObj other)
        {
            return __eq__(other);
        }
    }

    public partial class FloatType
    {
        public static FloatType unique = new FloatType { };

        public string __str__() => "float";

        public string Classname => "type";

        public bool __bool__()
        {
            return true;
        }

        public bool __eq__(DObj o)
        {
            return ReferenceEquals(this, o);
        }

        public bool Equals(DObj other)
        {
            return __eq__(other);
        }

        public DObj __call__(DObj[] args)
        {
            if (args.Length == 0) return MK.Int(0);
            if (args.Length != 1) throw new InvalidCastException($"object {__str__()} is not callable.");
            var x = args[0];
            switch (x)
            {
                case DInt i:
                    return MK.Float((float) i.value);
                case DFloat _:
                    return x;
                case DString s:
                    return MK.Float(float.Parse(s.value));
                default:
                    throw new InvalidCastException($"cannot cast {x.Classname} objects to {__str__()}");
            }
        }
    }

    public partial class StrType
    {
        public static StrType unique = new StrType { };

        public string __str__() => "str";

        public string Classname => "type";

        public bool __bool__()
        {
            return true;
        }

        public bool __eq__(DObj o)
        {
            return ReferenceEquals(this, o);
        }

        public bool Equals(DObj other)
        {
            return __eq__(other);
        }

        public DObj __call__(DObj[] args)
        {
            if (args.Length == 0) return MK.Int(0);
            if (args.Length != 1) throw new InvalidCastException($"object {__str__()} is not callable.");
            var x = args[0];
            return MK.String(x.__str__());
        }
    }

    public partial class IntType
    {
        public static IntType unique = new IntType { };
        public string __str__() => "int";
        public string Classname => "type";

        public bool __bool__()
        {
            return true;
        }

        public bool __eq__(DObj o)
        {
            return ReferenceEquals(this, o);
        }

        public bool Equals(DObj other)
        {
            return __eq__(other);
        }

        public DObj __call__(DObj[] args)
        {
            if (args.Length == 0) return MK.Int(0);
            if (args.Length != 1) throw new InvalidCastException($"object {this.__str__()} is not callable.");
            var x = args[0];
            switch (x)
            {
                case DInt _:
                    return x;
                case DFloat f:
                    return MK.Int((int_t) f.value);
                case DString s:
                    return MK.Int(int_t.Parse(s.value));
                default:
                    throw new InvalidCastException($"cannot cast {x.Classname} objects to {__str__()}");
            }
        }
    }
}