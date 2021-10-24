namespace Ava
{
    using System.Collections.Generic;
    using static Extensions;
    public static class Extensions
    {
        public static void RemoveAt(this List<DObj> self)
        {
            self.RemoveAt(self.Count - 1);
        }
    }
}