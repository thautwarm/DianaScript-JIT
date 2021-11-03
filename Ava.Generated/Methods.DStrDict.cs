using System;
using System.Linq;using System.Collections.Generic;
namespace Ava
{
public partial class DStrDict
{
  public string Classname  => "StrDict";
  public static DModule module_instance {get; private set;}
  public static DObj bind_remove(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling StrDict.remove; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      _arg0.Remove(_arg1);
      return MK.None();
    }
    throw new ArgumentException($"call StrDict.remove; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_clear(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling StrDict.clear; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    {
      _arg0.Clear();
      return MK.None();
    }
    throw new ArgumentException($"call StrDict.clear; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_len(DObj[] _args) // bind `this` prop 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"accessing StrDict.len; needs only 1 argument, got {nargs}.");
    var arg = _args[0];
    var ret = MK.unbox(THint<Dictionary<DObj, DObj>>.val, arg).Count;
    return MK.create(ret);
  }
  public static DObj bind_contains(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling StrDict.contains; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      _arg0.ContainsKey(_arg1);
      return MK.None();
    }
    throw new ArgumentException($"call StrDict.contains; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_search(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 3)
      throw new ArgumentException($"calling StrDict.search; needs at least  (3) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    var _out_2 = MK.unbox(THint<Ref>.val, _args[2]);
    var _arg2 = MK.unbox(THint<DObj>.val, _out_2.GetContents());
    {
      var _return = _arg0.TryGetValue(_arg1,out _arg2);
      _out_2.SetContents(MK.cast(THint<DObj>.val, _arg2));
      return MK.create(_return);
    }
    throw new ArgumentException($"call StrDict.search; needs at most (3) arguments, got {nargs}.");
  }
  public static DObj bind_items(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling StrDict.items; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<string, DObj>>.val, _args[0]);
    {
      var _return = CollectionExts.ObjectPairs(_arg0);
      return MK.create(_return);
    }
    throw new ArgumentException($"call StrDict.items; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_forkey(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling StrDict.forkey; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      _arg0.ForEachIndex_(_arg1);
      return MK.None();
    }
    throw new ArgumentException($"call StrDict.forkey; needs at most (2) arguments, got {nargs}.");
  }
  static DStrDict()
  {
    module_instance = new DModule("StrDict");
    module_instance.fields.Add("remove", MK.FuncN("StrDict.remove", bind_remove));
    module_instance.fields.Add("clear", MK.FuncN("StrDict.clear", bind_clear));
    module_instance.fields.Add("len", MK.FuncN("StrDict.len", bind_len));
    module_instance.fields.Add("contains", MK.FuncN("StrDict.contains", bind_contains));
    module_instance.fields.Add("search", MK.FuncN("StrDict.search", bind_search));
    module_instance.fields.Add("items", MK.FuncN("StrDict.items", bind_items));
    module_instance.fields.Add("forkey", MK.FuncN("StrDict.forkey", bind_forkey));
  }
}
}
