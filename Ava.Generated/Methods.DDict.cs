using System;
using System.Collections.Generic;
namespace Ava
{
public partial class DDict
{
  public static TypeObject_v1 classobject = new TypeObject_v1("dict");
  public static DObj bind___delitem__(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new TypeError($"calling dict.__delitem__; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      _arg0.Remove(_arg1);
      return MK.None();
    }
    throw new TypeError($"call dict.__delitem__; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_clear(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new TypeError($"calling dict.clear; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    {
      _arg0.Clear();
      return MK.None();
    }
    throw new TypeError($"call dict.clear; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_search(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 3)
      throw new TypeError($"calling dict.search; needs at least  (3) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Dictionary<DObj, DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    var _out_2 = MK.unbox(THint<Ref>.val, _args[2]);
    var _arg2 = MK.unbox(THint<DObj>.val, _out_2.GetContents());
    {
      var _return = _arg0.TryGetValue(_arg1,out _arg2);
      _out_2.SetContents(MK.cast(THint<DObj>.val, _arg2));
      return MK.create(_return);
    }
    throw new TypeError($"call dict.search; needs at most (3) arguments, got {nargs}.");
  }
  public static void SetupType()
  {
    classobject.methods = new System.Collections.Generic.Dictionary<string, DObj>
    {
      { "__delitem__", MK.FuncN("__delitem__", bind___delitem__) },
      { "clear", MK.FuncN("clear", bind_clear) },
      { "search", MK.FuncN("search", bind_search) },
    };
  }
}
}
