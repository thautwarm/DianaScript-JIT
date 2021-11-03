using System;
using System.Linq;using System.Collections.Generic;
namespace Ava
{
public partial class DIterable
{
  public string Classname  => "Enum";
  public static DModule module_instance {get; private set;}
  public static DObj bind_foreach(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Enum.foreach; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<IEnumerable<DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      _arg0.ForEach_(_arg1);
      return MK.None();
    }
    throw new ArgumentException($"call Enum.foreach; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_map(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Enum.map; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<IEnumerable<DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      var _return = _arg0.Map(_arg1);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Enum.map; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_mapi(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Enum.mapi; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<IEnumerable<DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      var _return = _arg0.MapI(_arg1);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Enum.mapi; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_range(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs < 1)
      throw new ArgumentException($"calling Enum.range; needs at least  (1,2,3) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<Int64>.val, _args[0]);
    if (nargs == 1)
    {
      var _return = CollectionExts.Range(_arg0);
      return MK.create(_return);
    }
    var _arg1 = MK.unbox(THint<Int64>.val, _args[1]);
    if (nargs == 2)
    {
      var _return = CollectionExts.Range(_arg0,_arg1);
      return MK.create(_return);
    }
    var _arg2 = MK.unbox(THint<Int64>.val, _args[2]);
    {
      var _return = CollectionExts.Range(_arg0,_arg1,_arg2);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Enum.range; needs at most (3) arguments, got {nargs}.");
  }
  static DIterable()
  {
    module_instance = new DModule("Enum");
    module_instance.fields.Add("foreach", MK.FuncN("Enum.foreach", bind_foreach));
    module_instance.fields.Add("map", MK.FuncN("Enum.map", bind_map));
    module_instance.fields.Add("mapi", MK.FuncN("Enum.mapi", bind_mapi));
    module_instance.fields.Add("range", MK.FuncN("Enum.range", bind_range));
  }
}
}
