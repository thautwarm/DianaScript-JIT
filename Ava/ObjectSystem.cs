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

        public object Native { get; }
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
        public int __len__();
        public IEnumerable<DObj> __iter__();
    }

    [Serializable]
    public partial class DInt
    {
        public Int64 value;

        public object Native => value;

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

    [Serializable]
    public partial class DFloat
    {
        public string __str__() => value.ToString();

        public object Native => value;
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

    [Serializable]
    public partial class DNone
    {
        public string __str__() => "None";
        public string Classname => "none";

        public object Native => this;

        public bool Equals(DObj other)
        {
            return this.__eq__(other);
        }

        public static DNone unique = new DNone();

        public bool __bool__()
        {
            return false;
        }

        public bool __eq__(DObj o)
        {
            return (o is DNone);
        }
    }

    [Serializable]
    public partial class DString
    {
        public object Native => value;

        public bool __contains__(DObj o)
        {
            return (o is DString s) && value.Contains(s.value);
        }
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

        public int __len__() => value.Length;
    }


    public partial class DDict
    {

        public object Native => dict;
        public int __len__() => dict.Count;

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


    public partial class DTuple
    {
        public object Native => elts;
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

        public bool __contains__(DObj o)
        {
            return elts.Contains(o);
        }

        public int __len__() => elts.Length;


        public bool Equals(DObj other)
        {
            return this.__eq__(other);
        }

        public DObj __get__(DObj o)
        {
            if(o is DInt i)
                return elts[(int) i.value];
            throw new ValueError($"cannot get tuple item with {o.__str__()}.");
        }


        public void __set__(DObj s, DObj value)
        {
            throw new ValueError($"cannot set tuple item.");
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

        public IEnumerable<DObj> __iter__()
        {
            return elts;
        }
    }

    public interface Ref: DObj
    {
        public void SetContents(DObj v);
        public DObj GetContents();
    }

    public partial class DList: Ref
    {

        public object Native => elts;
        public int __len__() => elts.Count;
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

        public bool __contains__(DObj o)
        {
            return elts.Contains(o);
        }

        public bool __eq__(DObj o)
        {
            return (o is DList a) && a.elts.Count == elts.Count && a.elts.SequenceEqual(elts);
        }

        public DObj __get__(DObj o)
        {
            if(o is DInt i)
                return elts[(int) i.value];
            throw new ValueError($"cannot get list item with {o.__str__()}.");
        }


        public void __set__(DObj s, DObj value)
        {
            if (s is DInt i)
            {
                elts[(int) i.value] = value;
                return;
            }
            throw new ValueError($"cannot set list item with {s.__str__()}.");
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

        public IEnumerable<DObj> __iter__()
        {
            return elts;
        }

        public void SetContents(DObj v)
        {
            if (v == null) return;
            elts[0] = v;
        }

        public DObj GetContents()
        {
            return elts[0];
        }
    }

    public partial class DNative
    {
        public object value;

        public object Native => value;
        public string Classname => "native";


        public string __str__()
        {
            return value.ToString();
        }
    }

    public partial class DFunc
    {
        public string __str__()
        {
            return name;
        }

        public object Native => func;

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

    // TODO: After C# 8.0 default interface gets adopted by Unity, we introduce small-talk OOP system
    public partial class TypeObject_v1
    {

        public object Native => this;

        public string typename;
        public Dictionary<string, DObj> methods;

        public TypeObject_v1(string typename)
        {
            this.typename = typename;
            this.methods = new Dictionary<string, DObj>();
        }
        public bool __bool__()
        {
            return true;
        }
        public string __str__() => typename;
        public string Classname => "type";

        public bool __eq__(DObj o)
        {
            return ReferenceEquals(this, o);
        }

        public bool Equals(DObj other)
        {
            return __eq__(other);
        }

        public DObj __get__(DObj attr)
        {
            if(attr is DString s && methods.TryGetValue(s.value, out var field))
            {
                return field;
            }
            throw new AttributeError(attr.__str__());
        }
        public DObj __call__(DObj[] objs)
        {
            if(methods.TryGetValue("__call__", out var field))
            {
                return field.__call__(objs);
            }
            throw new NotImplementedException();
        }
    }
    public static class FloatType
    {
        public static DObj __call__(DObj[] args)
        {
            if (args.Length == 0) return MK.Int(0);
            if (args.Length != 1) throw new InvalidCastException($"float object is not callable.");
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
                    throw new InvalidCastException($"cannot cast {x.Classname} objects to float");
            }
        }
    }

    public static partial class StrType
    {

        public static DObj __call__(DObj[] args)
        {
            if (args.Length == 0) return MK.Int(0);
            // TODO
            if (args.Length != 1) throw new InvalidCastException($"str object is not callable.");
            var x = args[0];
            return MK.String(x.__str__());
        }
    }

    public static partial class IntType
    {
        public static DObj __call__(DObj[] args)
        {
            if (args.Length == 0) return MK.Int(0);
            if (args.Length != 1) throw new InvalidCastException($"integer object is not callable.");
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
                    throw new InvalidCastException($"cannot cast {x.Classname} objects to int");
            }
        }
    }
}