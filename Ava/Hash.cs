using System;
using System.Collections.Generic;

namespace Ava
{
    public partial struct DInt
    {
        public override int GetHashCode()
        {
            return value.GetHashCode();
        }
    }

    public partial struct DFloat
    {
        public override int GetHashCode()
        {
            return value.GetHashCode();
        }
    }

    public partial struct DString
    {
        public override int GetHashCode()
        {
            return value.GetHashCode();
        }

        public override string ToString()
        {
            return value.ToString();
        }
    }

    public partial class DTuple
    {
        public override int GetHashCode()
        {
            unchecked
            {
                int hash = 17;
                for (var i = 0; i < elts.Length; i++)
                    hash = hash * 23 + elts[i].GetHashCode();
                return hash;
            }
        }
    }

    public partial struct DNone
    {
        public override int GetHashCode()
        {
            return 114514 ^ 267;
        }
    }

    public partial class DNative
    {
        public override int GetHashCode()
        {
            return value.GetHashCode();
        }
    }
}