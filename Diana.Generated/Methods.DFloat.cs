using System;

namespace Diana
{
public partial class DFloat
{
  public string Classname  => "Num";
  public static DModule module_instance {get; private set;}
  public static DObj bind_get_max(DObj[] _args) // bind cls prop 
  {
    var nargs = _args.Length;
    if (nargs != 0)
      throw new ArgumentException($"accessing Num.get_max; needs 0 arguments, got {nargs}.");
    var ret = Single.MaxValue;
    return MK.create(ret);  }
  public static DObj bind_get_min(DObj[] _args) // bind cls prop 
  {
    var nargs = _args.Length;
    if (nargs != 0)
      throw new ArgumentException($"accessing Num.get_min; needs 0 arguments, got {nargs}.");
    var ret = Single.MinValue;
    return MK.create(ret);  }
  public static DObj bind_of(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling Num.of; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<DObj>.val, _args[0]);
    {
      var _return = TypeConversion.toFloat(_arg0);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Num.of; needs at most (1) arguments, got {nargs}.");
  }
  static DFloat()
  {
    module_instance = new DModule("Num");
    module_instance.fields.Add("get_max", MK.FuncN("Num.get_max", bind_get_max));
    module_instance.fields.Add("get_min", MK.FuncN("Num.get_min", bind_get_min));
    module_instance.fields.Add("of", MK.FuncN("Num.of", bind_of));
  }
}
}
