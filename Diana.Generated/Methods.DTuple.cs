using System;
using System.Linq;using System.Collections.Generic;
namespace Diana
{
public partial class DTuple
{
  public string Classname  => "Tuple";
  public static DModule module_instance {get; private set;}
  public static DObj bind_len(DObj[] _args) // bind `this` prop 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"accessing Tuple.len; needs only 1 argument, got {nargs}.");
    var arg = _args[0];
    var ret = MK.unbox(THint<DObj[]>.val, arg).Length;
    return MK.create(ret);
  }
  public static DObj bind_of(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling Tuple.of; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<IEnumerable<DObj>>.val, _args[0]);
    {
      var _return = _arg0.ToArray();
      return MK.create(_return);
    }
    throw new ArgumentException($"call Tuple.of; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_forkey(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Tuple.forkey; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<DObj[]>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      _arg0.ForEachIndex_(_arg1);
      return MK.None();
    }
    throw new ArgumentException($"call Tuple.forkey; needs at most (2) arguments, got {nargs}.");
  }
  static DTuple()
  {
    module_instance = new DModule("Tuple");
    module_instance.fields.Add("len", MK.FuncN("Tuple.len", bind_len));
    module_instance.fields.Add("of", MK.FuncN("Tuple.of", bind_of));
    module_instance.fields.Add("forkey", MK.FuncN("Tuple.forkey", bind_forkey));
  }
}
}
