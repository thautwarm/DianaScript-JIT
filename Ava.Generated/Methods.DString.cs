using System;

namespace Ava
{
public partial class DString
{
  public static TypeObject_v1 classobject = new TypeObject_v1("str");
  public static DObj bind_join(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new TypeError($"calling str.join; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    var _arg1 = MK.cast(THint<String[]>.val, MK.unbox(THint<DObj>.val, _args[1]));
    {
      var _return = String.Join(_arg0,_arg1);
      return MK.create(_return);
    }
    throw new TypeError($"call str.join; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_concat(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new TypeError($"calling str.concat; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.cast(THint<String[]>.val, MK.unbox(THint<DObj>.val, _args[0]));
    {
      var _return = String.Concat(_arg0);
      return MK.create(_return);
    }
    throw new TypeError($"call str.concat; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_endswith(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new TypeError($"calling str.endswith; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    var _arg1 = MK.unbox(THint<String>.val, _args[1]);
    {
      var _return = _arg0.EndsWith(_arg1);
      return MK.create(_return);
    }
    throw new TypeError($"call str.endswith; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_startswith(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new TypeError($"calling str.startswith; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    var _arg1 = MK.unbox(THint<String>.val, _args[1]);
    {
      var _return = _arg0.StartsWith(_arg1);
      return MK.create(_return);
    }
    throw new TypeError($"call str.startswith; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind___len__(DObj[] _args) // bind `this` prop 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new TypeError($"accessing str.__len__; needs only 1 argument, got {nargs}.");
    var arg = _args[0];
    var ret = MK.unbox(THint<String>.val, arg).Length;
    return MK.create(ret);
  }
  public static DObj bind_strip(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new TypeError($"calling str.strip; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    var _arg1 = MK.cast(THint<Char[]>.val, MK.unbox(THint<String>.val, _args[1]));
    {
      var _return = _arg0.Trim(_arg1);
      return MK.create(_return);
    }
    throw new TypeError($"call str.strip; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_rstrip(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs < 1)
      throw new TypeError($"calling str.rstrip; needs at least  (1,2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    if (nargs == 1)
    {
      var _return = _arg0.TrimEnd();
      return MK.create(_return);
    }
    var _arg1 = MK.cast(THint<Char[]>.val, MK.unbox(THint<String>.val, _args[1]));
    {
      var _return = _arg0.TrimEnd(_arg1);
      return MK.create(_return);
    }
    throw new TypeError($"call str.rstrip; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_lstrip(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs < 1)
      throw new TypeError($"calling str.lstrip; needs at least  (1,2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    if (nargs == 1)
    {
      var _return = _arg0.TrimStart();
      return MK.create(_return);
    }
    var _arg1 = MK.cast(THint<Char[]>.val, MK.unbox(THint<String>.val, _args[1]));
    {
      var _return = _arg0.TrimStart(_arg1);
      return MK.create(_return);
    }
    throw new TypeError($"call str.lstrip; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_lower(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new TypeError($"calling str.lower; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    {
      var _return = _arg0.ToLowerInvariant();
      return MK.create(_return);
    }
    throw new TypeError($"call str.lower; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_upper(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new TypeError($"calling str.upper; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    {
      var _return = _arg0.ToUpperInvariant();
      return MK.create(_return);
    }
    throw new TypeError($"call str.upper; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind___contains__(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new TypeError($"calling str.__contains__; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    var _arg1 = MK.unbox(THint<String>.val, _args[1]);
    {
      var _return = _arg0.Contains(_arg1);
      return MK.create(_return);
    }
    throw new TypeError($"call str.__contains__; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_format(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs < 1)
      throw new TypeError($"calling str.format; needs at least >= (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    if (nargs == 1)
    {
      var _return = String.Format(_arg0);
      return MK.create(_return);
    }
    var _arg1 = new Object[nargs - 1];
    for(var _i = 1; _i < nargs; _i++)
      _arg1[_i - 1] = _args[_i];
    {
      var _return = String.Format(_arg0,_arg1);
      return MK.create(_return);
    }
  }
  public static DObj bind_substr(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs < 2)
      throw new TypeError($"calling str.substr; needs at least  (2,3) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    var _arg1 = MK.unbox(THint<Int32>.val, _args[1]);
    if (nargs == 2)
    {
      var _return = _arg0.Substring(_arg1);
      return MK.create(_return);
    }
    var _arg2 = MK.unbox(THint<Int32>.val, _args[2]);
    {
      var _return = _arg0.Substring(_arg1,_arg2);
      return MK.create(_return);
    }
    throw new TypeError($"call str.substr; needs at most (3) arguments, got {nargs}.");
  }
  public static DObj bind_insert(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 3)
      throw new TypeError($"calling str.insert; needs at least  (3) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    var _arg1 = MK.unbox(THint<Int32>.val, _args[1]);
    var _arg2 = MK.unbox(THint<String>.val, _args[2]);
    {
      var _return = _arg0.Insert(_arg1,_arg2);
      return MK.create(_return);
    }
    throw new TypeError($"call str.insert; needs at most (3) arguments, got {nargs}.");
  }
  public static DObj bind_remove(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs < 2)
      throw new TypeError($"calling str.remove; needs at least  (2,3) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    var _arg1 = MK.unbox(THint<Int32>.val, _args[1]);
    if (nargs == 2)
    {
      var _return = _arg0.Remove(_arg1);
      return MK.create(_return);
    }
    var _arg2 = MK.unbox(THint<Int32>.val, _args[2]);
    {
      var _return = _arg0.Remove(_arg1,_arg2);
      return MK.create(_return);
    }
    throw new TypeError($"call str.remove; needs at most (3) arguments, got {nargs}.");
  }
  public static DObj bind_index(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs < 2)
      throw new TypeError($"calling str.index; needs at least  (2,3,4) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    var _arg1 = MK.unbox(THint<String>.val, _args[1]);
    if (nargs == 2)
    {
      var _return = _arg0.IndexOf(_arg1);
      return MK.create(_return);
    }
    var _arg2 = MK.unbox(THint<Int32>.val, _args[2]);
    if (nargs == 3)
    {
      var _return = _arg0.IndexOf(_arg1,_arg2);
      return MK.create(_return);
    }
    var _arg3 = MK.unbox(THint<Int32>.val, _args[3]);
    {
      var _return = _arg0.IndexOf(_arg1,_arg2,_arg3);
      return MK.create(_return);
    }
    throw new TypeError($"call str.index; needs at most (4) arguments, got {nargs}.");
  }
  public static void SetupType()
  {
    classobject.methods = new System.Collections.Generic.Dictionary<string, DObj>
    {
      { "join", MK.FuncN("join", bind_join) },
      { "concat", MK.FuncN("concat", bind_concat) },
      { "endswith", MK.FuncN("endswith", bind_endswith) },
      { "startswith", MK.FuncN("startswith", bind_startswith) },
      { "__len__", MK.FuncN("__len__", bind___len__) },
      { "strip", MK.FuncN("strip", bind_strip) },
      { "rstrip", MK.FuncN("rstrip", bind_rstrip) },
      { "lstrip", MK.FuncN("lstrip", bind_lstrip) },
      { "lower", MK.FuncN("lower", bind_lower) },
      { "upper", MK.FuncN("upper", bind_upper) },
      { "__contains__", MK.FuncN("__contains__", bind___contains__) },
      { "format", MK.FuncN("format", bind_format) },
      { "substr", MK.FuncN("substr", bind_substr) },
      { "insert", MK.FuncN("insert", bind_insert) },
      { "remove", MK.FuncN("remove", bind_remove) },
      { "index", MK.FuncN("index", bind_index) },
    };
  }
}
}
