using System;
using System.Collections.Generic;

namespace Diana
{
    public static class InternStringExts
    {

        public static InternString toIntern(this string s)
        {
            return InternString.fromString(s);
        }

    }
    public struct InternString : IEquatable<InternString>, IComparable<InternString>, DObj
    {
        public string Classname => "symbol";
        static Dictionary<string, InternString> strToId = new Dictionary<string, InternString>();
        static Dictionary<int, string> idToStr = new Dictionary<int, string>();
        int identity;
        public int CompareTo(InternString other) => identity.CompareTo(other.identity);

        public bool Equals(InternString other) => identity == other.identity;

        public override string ToString() => idToStr[identity];
        public static InternString fromString(string s)
        {
            if (strToId.TryGetValue(s, out var id))
            {
                return id;
            }
            id = new InternString { identity = strToId.Count };
            strToId[s] = id;
            idToStr[id.identity] = s;

            return id;
        }

        public bool __eq__(DObj o) => o is InternString s && identity == s.identity;
        public bool __lt__(DObj o) => o is InternString s && identity < s.identity;

        public string __str__() => ":"+ToString();

        public override int GetHashCode()
        {
            return identity.GetHashCode() ^ 47;
        }

    }
}