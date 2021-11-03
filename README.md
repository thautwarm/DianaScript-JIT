Powered by [Typed BNF](https://github.com/thautwarm/typed-bnf).

## diana script

[![EN DOC](https://img.shields.io/badge/docs-v0.1-green.svg?style=flat)](https://github.com/thautwarm/DianaScript/blob/master/docs.md) [![CN DOC](https://img.shields.io/badge/文档-v0.1-green.svg?style=flat)](https://github.com/thautwarm/DianaScript/blob/master/docs-CN.md)

A fast interpreter implemented in C#, shipped with a mininal but expressive scripting language called **Diana**.

No DLR, No System.Reflection(.Emit), compatible to all Unity backends.

Diana Script features at

1. fast execution time and startup time
2. simplicity(see docs for the concise cheat sheet)
3. easy [.NET interops](#dotnet-interops)

Diana Script is ~0.5 fast as CPython(~2.5 fast than Jint), and expected to be **thread-safe**.

## Integration within Your Project(available to Unity env)

```C#
using Ava;
public static class YourApi
{
    public static void ExecFromPath(string path)
    {
        var apis = new DianaScriptAPIs();
        var globals = apis.InitGlobals();

        var ast = DianaScriptAPIs.Parse(path);
        var code = DianaScriptAPIs.compileModule(ast, path);
        VM.execute(code, globals);            
    }
}
```

## dotnet-interops


### Use `DObj` in .NET

```c#

public void Do(DObj diana_object)
{
    var i = (int) (DInt) diana_object; // if it's int
    var f = (float) (DFloat) diana_object; // if it's float
    var s = (string) (DString) diana_object; // it string

    if(diana_object.__bool__())
        do_some;
    
    diana_object.__add__(diana_object);
    // diana_object.__sub__(diana_object);


    // use diana_object as callable
    if(diana_object.__call__(diana_object, diana_object, ...).__bool__())
    {
        // ...
    }


    DObj int_obj = MK.Int(1000);
    DObj float_obj = MK.Float(15.0);
    DObj dict = MK.Dict( new Dictionary<DObj, DObj>
        {
            { int_obj, float_obj },
            { float_obj, int_obj },
        });
}
```

### Create Your Own `DObj` Classes


```C#
using Ava;
public record DMyClass(MyOwnClass o): DObj
{
    public object Native => o;

    public bool __eq__(DObj other) => (other is DMyClass o_) && o_.Equals(o);

    public DObj __get__(DObj s)
    {
        var attr = (string) (DString) s;
        switch(attr)
        {
            case "mymethod":
                return MK.FuncN( args => o.mymethod(args[0], args[1], args[2]) );
            case "myfield":
                // suppose it's an integer
                return MK.Int(o.myfield);
            case "myfield2":
                // can be any .NET object
                return MK.Wrap(o.myfield2);
            default:
                throw new InvalidOperationException(
                    $"scripts are not allowed to access {attr}!"
                );
        }
    }
}
```