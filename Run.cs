using Diana;
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
        var runner = DianaScriptAPIs.compileModule(ast, path);
        // code.ShowCode();
        runner(globals);            
    }
    public static void Main(string[] args)
    {

        if (args.Length != 0)
        {
            args.ToList().ForEach(ExecuteSourceFile);
            return;            
        }
        var apis = new Diana.DianaScriptAPIs();
        var globals = apis.InitGlobals();
        while (true)
        {
            Console.Write("> ");
            String input = Console.ReadLine(); ;
            var ast = Diana.DianaScriptAPIs.Parse(input, "repl");
            var ctx = MetaContext.Create("repl");
            var initPos = ctx.currentPos;
            var runner = DianaScriptAPIs.compileModule(ast, "repl", "repl");
            var res = runner(globals);
            Console.WriteLine(res.__repr__());
        }
    }
}
