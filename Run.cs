using System.Collections;
using System.Collections.Generic;
using System;
using System.Linq;
using Ava;
using Ava.Frontend;
using Antlr4.Runtime;



#if NUNITY
public static class Debug
{
    public static void Log(string s)
    {
        Console.WriteLine(s);
    }
}
#else
    using UnityEngine;
#endif

public static class DianaScriptAPIs
{
    // Start is called before the first frame update

#if NUNITY
    public static DObj time()
    {
        return MK.Int(System.DateTime.Now.Ticks);
    }
#else
    public static DObj time()
    {
        return MK.Float(Time.realtimeSinceStartup);
    }
#endif

    public static DObj classname(DObj o)
    {
        return MK.String(o.Classname);
    }

    public static DObj log(DObj[] args)
    {
        Debug.Log(String.Join(" ", args.Select(o => o.__str__())));
        return DNone.unique;
    }


    public static DObj assert(DObj[] args)
    {
        switch (args.Length)
        {
            case 1:
                if (!args[0].__bool__())
                    throw new AssertionError("");
                break;
            case 2:
                if (!args[0].__bool__())
                    throw new AssertionError(args[1].__str__());
                break;
            default:
                throw new ArgumentException($"assert accepts only 2 arguments.");

        }
        return DNone.unique;
    }

    public static Dictionary<string, DObj> InitGlobals()
    {
        return new Dictionary<string, DObj>
        {
            {"log", MK.FuncN("log", log)},
            {"classname", MK.Func1("classname", classname)},
            {"time", MK.Func0("time", time)},
            {"int", IntType.unique},
            {"float", FloatType.unique},
            {"str", StrType.unique},
            {"assert",  MK.FuncN("assert", assert)}
        };
    }

    public static void ExecuteSourceFiles(string[] paths)
    {
        var globals = InitGlobals();
        foreach(var path in paths)
        {
            ICharStream stream = CharStreams.fromPath(path);
            ITokenSource lexer = new DianaScriptLexer(stream);

            ITokenStream tokens = new CommonTokenStream(lexer);

            var parser = new DianaScriptParser(tokens);
            var result = parser.start().result.ToArray();
            var cps = Block.make(result, 0, 0).compile(MetaContext.Create());
            var res = CPSExecutor.Exec(globals, cps, path);
        }
    }
    public static void Main(string[] args)
    {

        if (args.Length != 0)
        {
            ExecuteSourceFiles(args);
            return;            
        }
        var globals = InitGlobals();
        while (true)
        {
            Console.Write("> ");
            String input = Console.ReadLine(); ;
            ICharStream stream = CharStreams.fromString(input);

            ITokenSource lexer = new DianaScriptLexer(stream);

            ITokenStream tokens = new CommonTokenStream(lexer);

            var parser = new DianaScriptParser(tokens);
            var result = parser.start().result.ToArray();
            var cps = Block.make(result, 0, 0).compile(MetaContext.Create());
            var res = CPSExecutor.Exec(globals, cps, "xxx");

            Console.WriteLine(res.__str__());
        }
    }
    public static void Main_back(string[] paths)
    {
        foreach (var path in paths)
        {
            var loader = new ByteASTLoader(path);
            var block = loader.ReadImmediateAST() as Block;

            var meta_ctx = MetaContext.Create();
            var cps = block.compile(meta_ctx);
            var globals = InitGlobals();
            CPSExecutor.Exec(globals, cps, path);
        }
    }
}
