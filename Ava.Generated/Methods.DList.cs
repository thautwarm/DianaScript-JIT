using System;
using System.Linq;using System.Collections.Generic;
namespace Ava
{
public partial class DList
{
  public string Classname  => "List";
  public static DModule module_instance {get; private set;}
  public static DObj bind_push(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling List.push; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      _arg0.Add(_arg1);
      return MK.None();
    }
    throw new ArgumentException($"call List.push; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_extend(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling List.extend; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    var _arg1 = MK.cast(THint<IEnumerable<DObj>>.val, MK.unbox(THint<DObj>.val, _args[1]));
    {
      _arg0.AddRange(_arg1);
      return MK.None();
    }
    throw new ArgumentException($"call List.extend; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_insert(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 3)
      throw new ArgumentException($"calling List.insert; needs at least  (3) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<Int32>.val, _args[1]);
    var _arg2 = MK.unbox(THint<DObj>.val, _args[2]);
    {
      _arg0.Insert(_arg1,_arg2);
      return MK.None();
    }
    throw new ArgumentException($"call List.insert; needs at most (3) arguments, got {nargs}.");
  }
  public static DObj bind_remove(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling List.remove; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      _arg0.Remove(_arg1);
      return MK.None();
    }
    throw new ArgumentException($"call List.remove; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_pop(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling List.pop; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    {
      var _return = _arg0.Pop();
      return MK.create(_return);
    }
    throw new ArgumentException($"call List.pop; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_find(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling List.find; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<Predicate<DObj>>.val, _args[1]);
    {
      var _return = _arg0.Find(_arg1);
      return MK.create(_return);
    }
    throw new ArgumentException($"call List.find; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_index(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs < 2)
      throw new ArgumentException($"calling List.index; needs at least  (2,3) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    if (nargs == 2)
    {
      _arg0.IndexOf(_arg1);
      return MK.None();
    }
    var _arg2 = MK.unbox(THint<Int32>.val, _args[2]);
    {
      _arg0.IndexOf(_arg1,_arg2);
      return MK.None();
    }
    throw new ArgumentException($"call List.index; needs at most (3) arguments, got {nargs}.");
  }
  public static DObj bind_remove_at(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling List.remove_at; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<Int32>.val, _args[1]);
    {
      _arg0.RemoveAt(_arg1);
      return MK.None();
    }
    throw new ArgumentException($"call List.remove_at; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_sort(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling List.sort; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    {
      _arg0.Sort();
      return MK.None();
    }
    throw new ArgumentException($"call List.sort; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_array(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling List.array; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    {
      var _return = _arg0.ToArray();
      return MK.create(_return);
    }
    throw new ArgumentException($"call List.array; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_clear(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling List.clear; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    {
      _arg0.Clear();
      return MK.None();
    }
    throw new ArgumentException($"call List.clear; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_of(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling List.of; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<IEnumerable<DObj>>.val, _args[0]);
    {
      var _return = _arg0.ToList();
      return MK.create(_return);
    }
    throw new ArgumentException($"call List.of; needs at most (1) arguments, got {nargs}.");
  }
  public static DObj bind_forkey(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 2)
      throw new ArgumentException($"calling List.forkey; needs at least  (2) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    var _arg1 = MK.unbox(THint<DObj>.val, _args[1]);
    {
      _arg0.ForEachIndex_(_arg1);
      return MK.None();
    }
    throw new ArgumentException($"call List.forkey; needs at most (2) arguments, got {nargs}.");
  }
  public static DObj bind_copy(DObj[] _args) // bind method 
  {
    var nargs = _args.Length;
    if (nargs != 1)
      throw new ArgumentException($"calling List.copy; needs at least  (1) arguments, got {nargs}.");
    var _arg0 = MK.unbox(THint<List<DObj>>.val, _args[0]);
    {
      var _return = _arg0.ShallowCopy();
      return MK.create(_return);
    }
    throw new ArgumentException($"call List.copy; needs at most (1) arguments, got {nargs}.");
  }
  static DList()
  {
    module_instance = new DModule("List");
    module_instance.fields.Add("push", MK.FuncN("List.push", bind_push));
    module_instance.fields.Add("extend", MK.FuncN("List.extend", bind_extend));
    module_instance.fields.Add("insert", MK.FuncN("List.insert", bind_insert));
    module_instance.fields.Add("remove", MK.FuncN("List.remove", bind_remove));
    module_instance.fields.Add("pop", MK.FuncN("List.pop", bind_pop));
    module_instance.fields.Add("find", MK.FuncN("List.find", bind_find));
    module_instance.fields.Add("index", MK.FuncN("List.index", bind_index));
    module_instance.fields.Add("remove_at", MK.FuncN("List.remove_at", bind_remove_at));
    module_instance.fields.Add("sort", MK.FuncN("List.sort", bind_sort));
    module_instance.fields.Add("array", MK.FuncN("List.array", bind_array));
    module_instance.fields.Add("clear", MK.FuncN("List.clear", bind_clear));
    module_instance.fields.Add("of", MK.FuncN("List.of", bind_of));
    module_instance.fields.Add("forkey", MK.FuncN("List.forkey", bind_forkey));
    module_instance.fields.Add("copy", MK.FuncN("List.copy", bind_copy));
  }
}
}
