using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;


namespace Diana
{
    using int_t = System.Int64;
    using uint_t = System.UInt64;


    [Serializable]
    public sealed partial class DInt : DObj
    {
        public static explicit operator int(DInt v) => (int)v.value;
        public static explicit operator ulong(DInt v) => unchecked((ulong)v.value);
        public static explicit operator long(DInt v) => v.value;
        public static explicit operator uint(DInt v) => unchecked((uint)v.value);
        public static explicit operator byte(DInt v) => (byte)v.value;
        public static explicit operator DInt(int v) => MK.Int(v);
        public static explicit operator DInt(long v) => MK.Int(v);
        public static explicit operator DInt(ulong v) => MK.Int(v);
        public static explicit operator DInt(uint v) => MK.Int(v);
        public static explicit operator DInt(byte v) => MK.Int(v);

        public Int64 value;

        public object Native => value;


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
    public sealed partial class DFloat : DObj
    {
        public static explicit operator float(DFloat v) => v.value;
        public static explicit operator DFloat(float v) => MK.Float(v);
        public static explicit operator DFloat(double v) => MK.Float((float)v);

        public object Native => value;


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
    public sealed partial class DNone : DObj
    {
        public string __str__() => "None";


        public object Native => this;

        public static DObj unique = new DNone();

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
    public sealed partial class DString : DObj
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
                yield return MK.String(new String(new char[] { c }));
            }
        }

        public int __len__() => value.Length;

        public DObj __mul__(DObj a)
        {
            var i = (int)(DInt)a;
            if (value.Length == 1)
                return MK.String(new String(value[0], i));
            return MK.String(string.Concat(Enumerable.Repeat(value, i)));
        }
    }


    public sealed partial class DDict : DObj
    {

        public object Native => dict;
        public int __len__() => dict.Count;

        public string __str__()
        {
            return "{"
                + String.Join(", ",
                    dict.Select(x =>
                        (x.Value == DNone.unique) ? (x.Key.__repr__()) : $"{x.Key.__repr__()}: {x.Value.__repr__()}"))
                + "}";
        }

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
                yield return obj.Key;
            }
        }

        public DObj __sub__(DObj o)
        {
            return MK.Dict(this.dict.DifferenceDObj(o));
        }

        public DObj __bitor__(DObj o)
        {
            return MK.Dict(this.dict.Union(o.__iter__()));
        }

        public DObj __bitand__(DObj o)
        {
            return MK.Dict(this.dict.Intersect(o.__iter__()));
        }

        public DObj __truediv__(DObj func)
        {

            var res = new Dictionary<DObj, DObj>();
            foreach (var elt in __iter__())
            {
                var group_key = func.__call1__(elt);
                if (res.TryGetValue(group_key, out var group))
                {
                    (group as DList).elts.Add(elt);
                    continue;
                }
                else
                {
                    group = MK.List(new List<DObj> { elt });
                    res[group_key] = group;
                }
            }
            return MK.Dict(res);
        }
    }

    public sealed partial class DTuple : DObj
    {
        public object Native => elts;
        public string __str__()
        {
            return "(" + String.Join(",", elts.Select(x => x.__repr__())) + ",)";
        }


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
            if (o is DInt i)
                return elts[(int)i.value];
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

            return MK.Tuple(elts.Concat(a.__iter__()).ToArray());

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

    public sealed partial class DList : Ref, DObj
    {

        public object Native => elts;
        public int __len__() => elts.Count;
        public string __str__()
        {
            return "[" + String.Join(",", elts.Select(x => x.__repr__())) + "]";
        }


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
            if (o is DInt i)
                return elts[(int)i.value];
            throw new ValueError($"cannot get list item with {o.__repr__()}.");
        }


        public void __set__(DObj s, DObj value)
        {
            if (s is DInt i)
            {
                elts[(int)i.value] = value;
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
            return MK.List(elts.Concat(a.__iter__()).ToList());
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

    public sealed partial class DNative : DObj
    {
        public object value;
        public object Native => value;
    }

    public sealed partial class DFunc : DObj
    {
        public string __str__() => name;

        public object Native => func;

        public Func<DObj[], DObj> func;

        public string name;


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

    public static class TypeConversion
    {
        public static DObj toFloat(DObj x)
        {
            switch (x)
            {
                case DInt i:
                    return MK.Float((float)i.value);
                case DFloat _:
                    return x;
                case DString s:
                    return MK.Float(float.Parse(s.value));
                default:
                    throw new InvalidCastException($"cannot cast {x.Classname} objects to float");
            }
        }

        public static DObj toStr(DObj x)
        {
            return MK.String(x.__str__());
        }

        public static DObj toInt(DObj x)
        {
            switch (x)
            {
                case DInt _:
                    return x;
                case DFloat f:
                    return MK.Int((int_t)f.value);
                case DString s:
                    return MK.Int(int_t.Parse(s.value));
                default:
                    throw new InvalidCastException($"cannot cast {x.Classname} objects to int");
            }
        }
    }
}