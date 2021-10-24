using System;

namespace Ava
{
public partial class DInt
{
  public static TypeObject_v1 classobject = new TypeObject_v1("int");
  public static DObj bind_max(DObj[] _args) // bind cls prop 
  {
    var nargs = _args.Length;
    if (nargs != 0)
      throw new TypeError($"accessing int.max; needs 0 arguments, got {nargs}.");
    var ret = Int64.MaxValue;
    return MK.create(ret);  }
  public static DObj bind_min(DObj[] _args) // bind cls prop 
  {
    var nargs = _args.Length;
    if (nargs != 0)
      throw new TypeError($"accessing int.min; needs 0 arguments, got {nargs}.");
    var ret = Int64.MinValue;
    return MK.create(ret);  }
  public static void SetupType()
  {
    classobject.methods = new System.Collections.Generic.Dictionary<string, DObj>
    {
      { "max", MK.FuncN("max", bind_max) },
      { "min", MK.FuncN("min", bind_min) },
    };
  }
}
}
