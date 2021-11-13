using Diana;
using System;
using System.Linq;
using System.Reflection;

public static partial class MainClass
{
    // Start is called before the first frame update
     
    public static void Main(string[] args)
    {

        // new Diana.Metagen.Metagen(Assembly.GetExecutingAssembly(), "Diana", "Diana.APIs/Generated");
        Diana.ModularDiana modularDiana = new Diana.ModularDiana();

        void ExecuteSourceFile(string path)
        {
            modularDiana.Exec(path);
        }


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
