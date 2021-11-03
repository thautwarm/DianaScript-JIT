using System;
using System.Linq;
using System.Collections.Generic;
namespace Ava
{
    public static partial class CollectionExts
    {
        public static List<V> ShallowCopy<V>(this List<V> self)
        {
            var res = new List<V>();
            foreach (var kv in self)
            {
                res.Add(kv);
            }
            return res;
        }

        public static V[] ShallowCopy<V>(this V[] self)
        {
            var res = new V[self.Length];
            self.CopyTo(res, 0);
            return res;
        }

        public static void AddAsSet(this Dictionary<DObj, DObj> self, DObj o)
        {
            self[o] = DNone.unique;
        }

        public static Dictionary<DObj, DObj> Union(this Dictionary<DObj, DObj> self, IEnumerable<DObj> other)
        {
            self = self.ShallowCopy();
            foreach(var x in other)
            {
                self[x] = DNone.unique;
            }
            return self;
        }

        public static void Merge(this Dictionary<DObj, DObj> self, IEnumerable<DObj> other)
        {
            foreach(var x in other)
            {
                self[x] = DNone.unique;
            }
        }

        public static void Merge(this Dictionary<string, DObj> self, IEnumerable<DObj> other)
        {
            foreach(var x in other)
            {
                self[(string) (DString) x] = DNone.unique;
            }
        }

        public static Dictionary<DObj, DObj> Intersect(this  Dictionary<DObj, DObj> self, IEnumerable<DObj> other)
        {
            var res = new Dictionary<DObj, DObj>();
            foreach(var x in other)
            {
                if (self.ContainsKey(x))
                {
                    res[x] = DNone.unique;
                }
            }
            return res;
        }


        public static IEnumerable<DObj> ObjectPairs(this Dictionary<DObj, DObj> self)
        {
            return self.Select(x => MK.tuple(x.Key, x.Value));
        }

        public static IEnumerable<DObj> ObjectPairs(this Dictionary<string, DObj> self)
        {
            return self.Select(x => MK.tuple(MK.String(x.Key), x.Value));
        }
        public static Dictionary<DObj, DObj> DifferenceDObj(this Dictionary<DObj, DObj> self, DObj other)
        {

            var res = new Dictionary<DObj, DObj>();

            var try_dict = other as DDict;
            if(try_dict != null)
            {
                foreach(var x in self)
                {
                    var dict = try_dict.dict;
                    if (!dict.ContainsKey(x.Key))
                    {
                        res[x.Key] = DNone.unique;
                    }
                }
                return res;
            }
            var set = other.__iter__().ToHashSet();
            foreach(var x in self)
            {
                if (!set.Contains(x.Key))
                {
                    res[x.Key] = DNone.unique;
                }
            }
            return res;
        }

        public static void ForEach_(this IEnumerable<DObj> self, DObj func)
        {
            var args = new DObj[1];
            foreach(var elt in self)
            {
                args[0] = elt;
                func.__call__(args);
            }
        }

        public static IEnumerable<DObj> Map(this IEnumerable<DObj> self, DObj func)
        {
            var args = new DObj[1];
            foreach(var elt in self)
            {
                args[0] = elt;
                yield return func.__call__(args);
            }
        }

        public static IEnumerable<DObj> MapI(this IEnumerable<DObj> self, DObj func)
        {
            var args = new DObj[2];
            var i = 0;
            foreach(var elt in self)
            {
                args[0] = MK.Int(i++);
                args[1] = elt;
                yield return func.__call__(args);
            }
        }

        public static void ForEachIndex_(this List<DObj> self, DObj func)
        {
            var args = new DObj[1];
            for(var i = 0; i < self.Count; i++)
            {
                args[0] = MK.Int(i);
                func.__call__(args);
            }
        }

       public static void ForEachIndex_(this DObj[] self, DObj func)
        {
            var args = new DObj[1];
            for(var i = 0; i < self.Length; i++)
            {
                args[0] = MK.Int(i);
                func.__call__(args);
            }
        }

        public static void ForEachIndex_(this Dictionary<DObj, DObj> self, DObj func)
        {
            var args = new DObj[1];

            foreach(var key in self.Keys)
            {
                args[0] = key;
                func.__call__(args);
            }
        }

        public static void ForEachIndex_(this Dictionary<string, DObj> self, DObj func)
        {
            var args = new DObj[1];

            foreach(var key in self.Keys)
            {
                args[0] = MK.String(key);
                func.__call__(args);
            }
        }

    }
}