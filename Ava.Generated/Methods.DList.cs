using System;
using System.Collections.Generic;
namespace Ava
{
public partial class DList
{
  public static TypeObject_v1 classobject = new TypeObject_v1("list");
  public static DObj bind_append(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new TypeError($"calling list.append; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      _arg0.Add(_arg1);
      return MK.None();
    }
    throw new TypeError($"call list.append; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_extend(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new TypeError($"calling list.extend; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    var _arg1 = MK.cast(THint<IEnumerable<DObj>>.val, MK.unbox(THint<DObj>.val, _args[1]));
    {
      _arg0.AddRange(_arg1);
      return MK.None();
    }
    throw new TypeError($"call list.extend; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_insert(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 3)
      throw new TypeError($"calling list.insert; needs at least  (3) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<Int32>.val, _args[1]);
    var _arg2 = MK.unbox(THint<DObj>.val, _args[2]);
    {
      _arg0.Insert(_arg1,_arg2);
      return MK.None();
    }
    throw new TypeError($"call list.insert; needs at most (3) arguments, got {nargs}.");
  }
  public static DObj bind_remove(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new TypeError($"calling list.remove; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      _arg0.Remove(_arg1);
      return MK.None();
    }
    throw new TypeError($"call list.remove; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_find(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new TypeError($"calling list.find; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<Predicate<DObj>>.val, _args[1]);
    {
      _arg0.Find(_arg1);
      return MK.None();
    }
    throw new TypeError($"call list.find; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_index(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs < 2)
      throw new TypeError($"calling list.index; needs at least  (2,3) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    if (nargs == 2)
    {
      _arg0.IndexOf(_arg1);
      return MK.None();
    }
    var _arg2 = MK.unbox(THint<Int32>.val, _args[2]);
    {
      _arg0.IndexOf(_arg1,_arg2);
      return MK.None();
    }
    throw new TypeError($"call list.index; needs at most (3) arguments, got {nargs}.");
  }
  public static DObj bind_pop(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs < 1)
      throw new TypeError($"calling list.pop; needs at least  (1,2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    if (nargs == 1)
    {
      _arg0.RemoveAt();
      return MK.None();
    }
    var _arg1 = MK.unbox(THint<Int32>.val, _args[1]);
    {
      _arg0.RemoveAt(_arg1);
      return MK.None();
    }
    throw new TypeError($"call list.pop; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_sort(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new TypeError($"calling list.sort; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    {
      _arg0.Sort();
      return MK.None();
    }
    throw new TypeError($"call list.sort; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_array(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new TypeError($"calling list.array; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    {
      var _return = _arg0.ToArray();
      return MK.create(_return);
    }
    throw new TypeError($"call list.array; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_clear(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new TypeError($"calling list.clear; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    {
      _arg0.Clear();
      return MK.None();
    }
    throw new TypeError($"call list.clear; needs at most (1) arguments, got {nargs}.");
  }
  public static void SetupType()
  {
    classobject.methods = new System.Collections.Generic.Dictionary<string, DObj>
    {
      { "append", MK.FuncN("append", bind_append) },
      { "extend", MK.FuncN("extend", bind_extend) },
      { "insert", MK.FuncN("insert", bind_insert) },
      { "remove", MK.FuncN("remove", bind_remove) },
      { "find", MK.FuncN("find", bind_find) },
      { "index", MK.FuncN("index", bind_index) },
      { "pop", MK.FuncN("pop", bind_pop) },
      { "sort", MK.FuncN("sort", bind_sort) },
      { "array", MK.FuncN("array", bind_array) },
      { "clear", MK.FuncN("clear", bind_clear) },
    };
  }
}
}
