using System.Collections;
using System.Collections.Generic;
using System;
using System.Linq;
using Ava;
using Ava.Frontend;
using Antlr4.Runtime;
using System.IO;

partial class XParser: IAntlrErrorListener<IToken>
{

    public void SyntaxError(TextWriter output, IRecognizer recognizer, IToken offendingSymbol, int line, int charPositionInLine, string msg, RecognitionException e)
    {
        Console.WriteLine("Error in Parser at line " + e.OffendingToken.Line + ":" + e.OffendingToken.Column + "=>" + e.StackTrace);
    }
}
public static partial class MainClass
{
    // Start is called before the first frame update

    public static void ExecuteSourceFiles(string[] paths)
    {
        var apis = new Ava.DianaScriptAPIs();
        var globals = apis.InitGlobals();
        
        foreach(var path in paths)
        {
            var ast = Ava.DianaScriptAPIs.Parse(path);
            var ctx = MetaContext.Create(path);
            var initPos = ctx.currentPos;
            ast.emit(ctx);
            var (_, code) = ctx.buildCode(initPos, new string[0]);
            // code.ShowCode();
            VM.execute(code, new DObj[0], new DObj[0], globals);            
        }
    }
    public static void Main(string[] args)
    {

        if (args.Length != 0)
        {
            ExecuteSourceFiles(args);
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
            Console.WriteLine(res.__str__());
        }
    }
}
