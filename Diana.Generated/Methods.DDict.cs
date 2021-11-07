using System;
using System.Collections.Generic;
namespace Diana
{
public partial class DDict
{
  public string Classname  => "Dict";
  public static DModule module_instance {get; private set;}
  public static DObj bind_remove(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Dict.remove; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      _arg0.Remove(_arg1);
      return MK.None();
    }
    throw new ArgumentException($"call Dict.remove; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_clear(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling Dict.clear; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    {
      _arg0.Clear();
      return MK.None();
    }
    throw new ArgumentException($"call Dict.clear; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_len(DObj[] _args) // bind `this` prop 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"accessing Dict.len; needs only 1 argument, got {nargs}.");
    var arg = _args[0];
    var ret = MK.unbox(THint<Dictionary<DObj, DObj>>.val, arg).Count;
    return MK.create(ret);
  }
  public static DObj bind_contains(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Dict.contains; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      _arg0.ContainsKey(_arg1);
      return MK.None();
    }
    throw new ArgumentException($"call Dict.contains; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_search(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 3)
      throw new ArgumentException($"calling Dict.search; needs at least  (3) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    var _out_2 = MK.unbox(THint<Ref>.val, _args[2]);
    var _arg2 = MK.unbox(THint<DObj>.val, _out_2.GetContents());
    {
      var _return = _arg0.TryGetValue(_arg1,out _arg2);
      _out_2.SetContents(MK.cast(THint<DObj>.val, _arg2));
      return MK.create(_return);
    }
    throw new ArgumentException($"call Dict.search; needs at most (3) arguments, got {nargs}.");
  }
  public static DObj bind_subtract(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Dict.subtract; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      var _return = CollectionExts.DifferenceDObj(_arg0,_arg1);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Dict.subtract; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_union(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Dict.union; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<IEnumerable<DObj>>.val, _args[1]);
    {
      var _return = CollectionExts.Union(_arg0,_arg1);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Dict.union; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_union_dict(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Dict.union_dict; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[1]);
    {
      var _return = CollectionExts.UnionDict(_arg0,_arg1);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Dict.union_dict; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_intersect(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Dict.intersect; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<IEnumerable<DObj>>.val, _args[1]);
    {
      var _return = CollectionExts.Intersect(_arg0,_arg1);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Dict.intersect; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_add(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Dict.add; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      CollectionExts.AddAsSet(_arg0,_arg1);
      return MK.None();
    }
    throw new ArgumentException($"call Dict.add; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_quotient(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Dict.quotient; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<DDict>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      var _return = _arg0.__truediv__(_arg1);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Dict.quotient; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_items(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling Dict.items; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    {
      var _return = CollectionExts.ObjectPairs(_arg0);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Dict.items; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_forkey(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Dict.forkey; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      _arg0.ForEachIndex_(_arg1);
      return MK.None();
    }
    throw new ArgumentException($"call Dict.forkey; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_update(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Dict.update; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[1]);
    {
      _arg0.Merge(_arg1);
      return MK.None();
    }
    throw new ArgumentException($"call Dict.update; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_of(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling Dict.of; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<IEnumerable<DObj>>.val, _args[0]);
    {
      var _return = CollectionExts.dictOf(_arg0);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Dict.of; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_setOf(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling Dict.setOf; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<IEnumerable<DObj>>.val, _args[0]);
    {
      var _return = CollectionExts.setOf(_arg0);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Dict.setOf; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_copy(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling Dict.copy; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    {
      var _return = _arg0.ShallowCopy();
      return MK.create(_return);
    }
    throw new ArgumentException($"call Dict.copy; needs at most (1) arguments, got {nargs}.");
  }
  static DDict()
  {
    module_instance = new DModule("Dict");
    module_instance.fields.Add("remove", MK.FuncN("Dict.remove", bind_remove));
    module_instance.fields.Add("clear", MK.FuncN("Dict.clear", bind_clear));
    module_instance.fields.Add("len", MK.FuncN("Dict.len", bind_len));
    module_instance.fields.Add("contains", MK.FuncN("Dict.contains", bind_contains));
    module_instance.fields.Add("search", MK.FuncN("Dict.search", bind_search));
    module_instance.fields.Add("subtract", MK.FuncN("Dict.subtract", bind_subtract));
    module_instance.fields.Add("union", MK.FuncN("Dict.union", bind_union));
    module_instance.fields.Add("union_dict", MK.FuncN("Dict.union_dict", bind_union_dict));
    module_instance.fields.Add("intersect", MK.FuncN("Dict.intersect", bind_intersect));
    module_instance.fields.Add("add", MK.FuncN("Dict.add", bind_add));
    module_instance.fields.Add("quotient", MK.FuncN("Dict.quotient", bind_quotient));
    module_instance.fields.Add("items", MK.FuncN("Dict.items", bind_items));
    module_instance.fields.Add("forkey", MK.FuncN("Dict.forkey", bind_forkey));
    module_instance.fields.Add("update", MK.FuncN("Dict.update", bind_update));
    module_instance.fields.Add("of", MK.FuncN("Dict.of", bind_of));
    module_instance.fields.Add("setOf", MK.FuncN("Dict.setOf", bind_setOf));
    module_instance.fields.Add("copy", MK.FuncN("Dict.copy", bind_copy));
  }
}
}
