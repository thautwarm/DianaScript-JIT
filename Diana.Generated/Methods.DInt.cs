using System;

namespace Diana
{
public partial class DInt
{
  public string Classname  => "Int";
  public static DModule module_instance {get; private set;}
  public static DObj bind_get_max(DObj[] _args) // bind cls prop 
  {
    var nargs = _args.Length;
    if (nargs != 0)
      throw new ArgumentException($"accessing Int.get_max; needs 0 arguments, got {nargs}.");
    var ret = Int64.MaxValue;
    return MK.create(ret);  }
  public static DObj bind_get_min(DObj[] _args) // bind cls prop 
  {
    var nargs = _args.Length;
    if (nargs != 0)
      throw new ArgumentException($"accessing Int.get_min; needs 0 arguments, got {nargs}.");
    var ret = Int64.MinValue;
    return MK.create(ret);  }
  public static DObj bind_of(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling Int.of; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<DObj>.val, _args[0]);
    {
      var _return = TypeConversion.toInt(_arg0);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Int.of; needs at most (1) arguments, got {nargs}.");
  }
  static DInt()
  {
    module_instance = new DModule("Int");
    module_instance.fields.Add("get_max", MK.FuncN("Int.get_max", bind_get_max));
    module_instance.fields.Add("get_min", MK.FuncN("Int.get_min", bind_get_min));
    module_instance.fields.Add("of", MK.FuncN("Int.of", bind_of));
  }
}
}
