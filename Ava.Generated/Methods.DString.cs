using System;

namespace Ava
{
public partial class DString
{
  public string Classname  => "Str";
  public static DModule module_instance {get; private set;}
  public static DObj bind_join(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Str.join; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    var _arg1 = MK.cast(THint<String[]>.val, MK.unbox(THint<DObj>.val, _args[1]));
    {
      var _return = String.Join(_arg0,_arg1);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Str.join; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_concat(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling Str.concat; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.cast(THint<String[]>.val, MK.unbox(THint<DObj>.val, _args[0]));
    {
      var _return = String.Concat(_arg0);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Str.concat; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_endswith(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Str.endswith; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    var _arg1 = MK.unbox(THint<String>.val, _args[1]);
    {
      var _return = _arg0.EndsWith(_arg1);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Str.endswith; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_startswith(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Str.startswith; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    var _arg1 = MK.unbox(THint<String>.val, _args[1]);
    {
      var _return = _arg0.StartsWith(_arg1);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Str.startswith; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_len(DObj[] _args) // bind `this` prop 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"accessing Str.len; needs only 1 argument, got {nargs}.");
    var arg = _args[0];
    var ret = MK.unbox(THint<String>.val, arg).Length;
    return MK.create(ret);
  }
  public static DObj bind_strip(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Str.strip; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    var _arg1 = MK.cast(THint<Char[]>.val, MK.unbox(THint<String>.val, _args[1]));
    {
      var _return = _arg0.Trim(_arg1);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Str.strip; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_rstrip(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs < 1)
      throw new ArgumentException($"calling Str.rstrip; needs at least  (1,2) arguments, got {nargs}.");
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
    throw new ArgumentException($"call Str.rstrip; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_lstrip(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs < 1)
      throw new ArgumentException($"calling Str.lstrip; needs at least  (1,2) arguments, got {nargs}.");
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
    throw new ArgumentException($"call Str.lstrip; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_lower(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling Str.lower; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    {
      var _return = _arg0.ToLowerInvariant();
      return MK.create(_return);
    }
    throw new ArgumentException($"call Str.lower; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_upper(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling Str.upper; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    {
      var _return = _arg0.ToUpperInvariant();
      return MK.create(_return);
    }
    throw new ArgumentException($"call Str.upper; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_contains(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling Str.contains; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    var _arg1 = MK.unbox(THint<String>.val, _args[1]);
    {
      var _return = _arg0.Contains(_arg1);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Str.contains; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_format(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs < 1)
      throw new ArgumentException($"calling Str.format; needs at least >= (1) arguments, got {nargs}.");
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
      throw new ArgumentException($"calling Str.substr; needs at least  (2,3) arguments, got {nargs}.");
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
    throw new ArgumentException($"call Str.substr; needs at most (3) arguments, got {nargs}.");
  }
  public static DObj bind_insert(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 3)
      throw new ArgumentException($"calling Str.insert; needs at least  (3) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<String>.val, _args[0]);
    var _arg1 = MK.unbox(THint<Int32>.val, _args[1]);
    var _arg2 = MK.unbox(THint<String>.val, _args[2]);
    {
      var _return = _arg0.Insert(_arg1,_arg2);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Str.insert; needs at most (3) arguments, got {nargs}.");
  }
  public static DObj bind_remove(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs < 2)
      throw new ArgumentException($"calling Str.remove; needs at least  (2,3) arguments, got {nargs}.");
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
    throw new ArgumentException($"call Str.remove; needs at most (3) arguments, got {nargs}.");
  }
  public static DObj bind_index(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs < 2)
      throw new ArgumentException($"calling Str.index; needs at least  (2,3,4) arguments, got {nargs}.");
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
    throw new ArgumentException($"call Str.index; needs at most (4) arguments, got {nargs}.");
  }
  public static DObj bind_of(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling Str.of; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<DObj>.val, _args[0]);
    {
      var _return = TypeConversion.toStr(_arg0);
      return MK.create(_return);
    }
    throw new ArgumentException($"call Str.of; needs at most (1) arguments, got {nargs}.");
  }
  static DString()
  {
    module_instance = new DModule("Str");
    module_instance.fields.Add("join", MK.FuncN("Str.join", bind_join));
    module_instance.fields.Add("concat", MK.FuncN("Str.concat", bind_concat));
    module_instance.fields.Add("endswith", MK.FuncN("Str.endswith", bind_endswith));
    module_instance.fields.Add("startswith", MK.FuncN("Str.startswith", bind_startswith));
    module_instance.fields.Add("len", MK.FuncN("Str.len", bind_len));
    module_instance.fields.Add("strip", MK.FuncN("Str.strip", bind_strip));
    module_instance.fields.Add("rstrip", MK.FuncN("Str.rstrip", bind_rstrip));
    module_instance.fields.Add("lstrip", MK.FuncN("Str.lstrip", bind_lstrip));
    module_instance.fields.Add("lower", MK.FuncN("Str.lower", bind_lower));
    module_instance.fields.Add("upper", MK.FuncN("Str.upper", bind_upper));
    module_instance.fields.Add("contains", MK.FuncN("Str.contains", bind_contains));
    module_instance.fields.Add("format", MK.FuncN("Str.format", bind_format));
    module_instance.fields.Add("substr", MK.FuncN("Str.substr", bind_substr));
    module_instance.fields.Add("insert", MK.FuncN("Str.insert", bind_insert));
    module_instance.fields.Add("remove", MK.FuncN("Str.remove", bind_remove));
    module_instance.fields.Add("index", MK.FuncN("Str.index", bind_index));
    module_instance.fields.Add("of", MK.FuncN("Str.of", bind_of));
  }
}
}
