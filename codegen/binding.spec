boxedtypes {
    DObj
    DList
    DDict
    DInt
    DString
    DFloat
    DNone
    DTuple
    DFunc
}

// name in script language, name in .net, .net wrap type name


"using System.Collections.Generic;"
Dict DDict Dictionary<DObj, DObj> {
    void this.Remove(DObj) as remove
    void this.Clear() as clear
    void this.Count as len
    void this.ContainsKey(DObj) as contains
    bool this.TryGetValue(DObj, out DObj) as search
    bool CollectionExts.DifferenceDObj(Dictionary<DObj, DObj>, DObj) as subtract
    bool CollectionExts.Union(Dictionary<DObj, DObj>, IEnumerable<DObj>) as union
    bool CollectionExts.Intersect(Dictionary<DObj, DObj>, IEnumerable<DObj>) as intersect
    void CollectionExts.AddAsSet(Dictionary<DObj, DObj>, DObj) as add
    bool this DDict.__truediv__(DObj) as quotient
    IEnumerable<DObj> CollectionExts.ObjectPairs(Dictionary<DObj, DObj>) as items
    void this.ForEachIndex_(DObj) as forkey
}


"using System.Linq;"
"using System.Collections.Generic;"
StrDict DStrDict Dictionary<DObj, DObj> {
    void this.Remove(DObj) as remove
    void this.Clear() as clear
    int this.Count as len
    void this.ContainsKey(DObj) as contains
    bool this.TryGetValue(DObj, out DObj) as search
    IEnumerable<DObj> CollectionExts.ObjectPairs(Dictionary<string, DObj>) as items
    void this.ForEachIndex_(DObj) as forkey
}

"using System.Collections.Generic;"
Str DString String {
    String Join(String, IEnumerable<String> from DObj) as join
    String Concat(IEnumerable<String> from DObj)  as concat
    bool this.EndsWith(String) as endswith
    bool this.StartsWith(String) as startswith
    int this.Length as len
    String this.Trim(Char[]? from String) as strip
    String this.TrimEnd(Char[]? from String) as rstrip
    String this.TrimStart(Char[]? from String) as lstrip
    String this.ToLowerInvariant() as lower
    String this.ToUpperInvariant() as upper
    bool this.Contains(String) as contains
    String String.Format(String, *Object) as format
    String this.Substring(Int32, Int32?) as substr
    String this.Insert(Int32, String) as insert
    String this.Remove(Int32, Int32?) as remove_at
    int this.IndexOf(String, Int32?, Int32?) as index
    DObj TypeConversion.toStr(DObj) as of
}

Int DInt Int64 {
    Int64 MaxValue as get_max
    Int64 MinValue as get_min
    DObj TypeConversion.toInt(DObj) as of
}

Num DFloat Single {
    float MaxValue as get_max
    float MinValue as get_min
    DObj TypeConversion.toFloat(DObj) as of
}

"using System.Linq;"
"using System.Collections.Generic;"
Tuple DTuple DObj[] {
    int this.Length as len
    DObj[] this IEnumerable<DObj> .ToArray() as of
    void this.ForEachIndex_(DObj) as forkey
}

"using System.Linq;"
"using System.Collections.Generic;"
List DList List<DObj> {
    void this.Add(DObj) as push
    void this.AddRange(IEnumerable<DObj> from DObj) as extend
    void this.Insert(Int32, DObj) as insert
    void this.Remove(DObj) as remove
    DObj this.Pop() as pop
    DObj this.Find(Predicate<DObj>) as find
    void this.IndexOf(DObj, Int32?) as index
    void this.RemoveAt(Int32) as remove_at
    void this.Sort() as sort
    DObj[] this.ToArray() as array
    void this.Clear() as clear
    List<DObj> this IEnumerable<DObj> .ToList() as of
    void this.ForEachIndex_(DObj) as forkey
}

"using System.Linq;"
"using System.Collections.Generic;"
Enum DIterable IEnumerable<DObj>
{
    void this.ForEach_(DObj) as foreach
    IEnumerable<DObj> this.Map(DObj) as map
    IEnumerable<DObj> this.MapI(DObj) as mapi
}

// override Equals according to "==" 
// override ToString according to "__str__"
// 
