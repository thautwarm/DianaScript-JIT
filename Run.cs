using Ava;
using System;
using System.Linq;

public static partial class MainClass
{
    // Start is called before the first frame update

    public static void ExecuteSourceFile(string path)
    {
        var apis = new DianaScriptAPIs();
        var globals = apis.InitGlobals();
        var ast = DianaScriptAPIs.Parse(path);
        var code = DianaScriptAPIs.compileModule(ast, path);
        // code.ShowCode();
        VM.execute(code, globals);            
    }
    public static void Main(string[] args)
    {

        if (args.Length != 0)
        {
            args.ToList().ForEach(ExecuteSourceFile);
            return;            
        }
        var apis = new Ava.DianaScriptAPIs();
        var globals = apis.InitGlobals();
        while (true)
        {
            Console.Write("> ");
            String input = Console.ReadLine(); ;
            var ast = Ava.DianaScriptAPIs.Parse(input, "repl");
            var ctx = MetaContext.Create("repl");
            var initPos = ctx.currentPos;
            ast.emit(ctx);
            var (_, code) = ctx.buildCode(initPos, new string[0]);
            // code.ShowCode();
            var res = VM.execute(code, new DObj[0], new DObj[0], globals);
            Console.WriteLine(res.__repr__());
        }
    }
}
