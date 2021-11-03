using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;


namespace Ava
{
    using int_t = System.Int64;
    using uint_t = System.UInt64;

    [Serializable]
    public sealed partial class DInt: DObj
    {
        public static explicit operator int(DInt v) => (int) v.value;
        public static explicit operator ulong(DInt v) => unchecked((ulong) v.value);
        public static explicit operator long(DInt v) => v.value;
        public static explicit operator uint(DInt v) => unchecked((uint) v.value);
        public static explicit operator byte(DInt v)  => (byte)v.value;
        public static explicit operator DInt(int v) => MK.Int(v);
        public static explicit operator DInt(long v) => MK.Int(v);
        public static explicit operator DInt(ulong v) => MK.Int(v);
        public static explicit operator DInt(uint v) => MK.Int(v);
        public static explicit operator DInt(byte v) => MK.Int(v);
    
        public Int64 value;

        public object Native => value;
        public string Classname => "int";

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
    public sealed partial class DFloat: DObj
    {
        public static explicit operator float(DFloat v) => v.value;
        public static explicit operator DFloat(float v) => MK.Float(v);
        public static explicit operator DFloat(double v) => MK.Float((float) v);
    
        public object Native => value;
        public string Classname => "float";

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

            return false;
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

            throw new ValueError($"cannot compare float with {o.__repr__()}");
        }
    }

    [Serializable]
    public sealed partial class DNone: DObj
    {
        public string __str__() => "None";
        public string Classname => "none";

        public object Native => this;

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
    public sealed partial class DString: DObj
    {
        public static explicit operator string(DString o) => o.value;
        public static explicit operator DString(string o) => MK.String(o);
        public object Native => value;

        public bool __contains__(DObj o)
        {
            return (o is DString s) && value.Contains(s.value);
        }
        public string __str__() => value;
        public string __repr__() => "\"" + value.Replace("\"", "\\\"") + "\"";
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


    public sealed partial class DDict: DObj
    {

        public object Native => dict;
        public int __len__() => dict.Count;

        public string __str__()
        {
            return "{" + String.Join(", ", dict.Select(x =>
                $"{x.Key.__repr__()}: {x.Value.__repr__()}")) + "}";
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

    public sealed partial class DStrDict: DObj
    {

        public object Native => dict;
        public int __len__() => dict.Count;

        public string __str__()
        {
            return "{|" + String.Join(", ", dict.Select(x =>
                $"{x.Key}: {x.Value.__repr__()}")) + "|}";
        }

        public string Classname => "dict";
        public Dictionary<string, DObj> dict;


        public bool __bool__()
        {
            return dict.Count != 0;
        }


        public bool __eq__(DObj o)
        {
            return (o is DStrDict a) && a.dict.Count == dict.Count && !dict.Except(a.dict).Any();
        }

        public DObj __get__(DObj s)
        {
            return dict[(string) (DString) s];
        }


        public void __set__(DObj s, DObj value)
        {
            dict[(string) (DString) s] = value;
        }

        public bool Equals(DObj other)
        {
            return this.__eq__(other);
        }


        public bool __contains__(DObj a)
        {
            return dict.ContainsKey((string) (DString) a);
        }

        public IEnumerable<DObj> __iter__()
        {
            foreach (var obj in dict)
            {
                yield return MK.Tuple(new[] {MK.String(obj.Key), obj.Value});
            }
        }
    }


    public sealed partial class DTuple: DObj
    {
        public object Native => elts;
        public string __str__()
        {
            return "(" + String.Join(",", elts.Select(x => x.__repr__())) + ",)";
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
            throw new ValueError($"cannot get tuple item with {o.__repr__()}.");
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

    public interface Ref
    {
        public void SetContents(DObj v);
        public DObj GetContents();
    }

    public sealed partial class DList: Ref, DObj
    {

        public object Native => elts;
        public int __len__() => elts.Count;
        public string __str__()
        {
            return "[" + String.Join(",", elts.Select(x => x.__repr__())) + "]";
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
            throw new ValueError($"cannot get list item with {o.__repr__()}.");
        }


        public void __set__(DObj s, DObj value)
        {
            if (s is DInt i)
            {
                elts[(int) i.value] = value;
                return;
            }
            throw new ValueError($"cannot set list item with {s.__repr__()}.");
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

    public sealed partial class DNative: DObj
    {
        public object value;
        public object Native => value;
        public string Classname => "native";
    }

    public sealed partial class DFunc: DObj
    {
        public string __str__() => name;

        public object Native => func;

        public Func<DObj[], DObj> func;

        public string name;
        public string Classname => "function";

        public DObj __call__(params DObj[] args) => func(args);

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
    public sealed partial class TypeObject_v1: DObj
    {

        public object Native => this;

        public string typename;
        public Dictionary<string, DObj> methods;

        public TypeObject_v1(string typename)
        {
            this.typename = typename;
            this.methods = new Dictionary<string, DObj>();
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
        public DObj __call__(params DObj[] objs)
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
        public static DObj __call__(params DObj[] args)
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