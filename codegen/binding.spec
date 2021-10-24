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

float DFloat Single {}
// name in script language, name in .net, .net wrap type name


"using System.Collections.Generic;"
dict DDict Dictionary<DObj, DObj> {
    void this.Remove(DObj) as __delitem__
    void this.Clear() as clear
    bool this.TryGetValue(DObj, out DObj) as search
}

str DString String {
    String Join(String, String[] from DObj)  as join
    String Concat(String[] from DObj)  as concat
    bool this.EndsWith(String) as endswith
    bool this.StartsWith(String) as startswith
    int this.Length as __len__
    String this.Trim(Char[] from String) as strip
    String this.TrimEnd(Char[]? from String) as rstrip
    String this.TrimStart(Char[]? from String) as lstrip
    String this.ToLowerInvariant() as lower
    String this.ToUpperInvariant() as upper
    bool this.Contains(String) as __contains__
    String String.Format(String, *Object) as format
    String this.Substring(Int32, Int32?) as substr
    String this.Insert(Int32, String) as insert
    String this.Remove(Int32, Int32?) as remove
    int this.IndexOf(String, Int32?, Int32?) as index
}

int DInt Int64 {
    Int64 MaxValue as max
    Int64 MinValue as min
}


"using System.Collections.Generic;"
list DList List<DObj> {
    void this.Add(DObj) as append
    void this.AddRange(IEnumerable<DObj> from DObj) as extend
    void this.Insert(Int32, DObj) as insert
    void this.Remove(DObj) as remove
    void this.Find(Predicate<DObj>) as find
    void this.IndexOf(DObj, Int32?) as index
    void this.RemoveAt(Int32?) as pop
    void this.Sort() as sort
    DObj[] this.ToArray() as array
    void this.Clear() as clear
}

// override Equals according to "==" 
// override ToString according to "__str__"
// 
