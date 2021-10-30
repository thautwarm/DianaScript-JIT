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
            var cps = Ava.DianaScriptAPIs.Parse(path).compile(MetaContext.Create());
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
        var apis = new Ava.DianaScriptAPIs();
        var globals = apis.InitGlobals();
        while (true)
        {
            Console.Write("> ");
            String input = Console.ReadLine(); ;
            ICharStream stream = CharStreams.fromString(input);

            ITokenSource lexer = new DianaScriptLexer(stream);

            ITokenStream tokens = new CommonTokenStream(lexer);

            var parser = new DianaScriptParser(tokens);
            parser.RemoveErrorListeners();
            parser.AddErrorListener(new XParser());
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
            var globals = new Ava.DianaScriptAPIs().InitGlobals();
            CPSExecutor.Exec(globals, cps, path);
        }
    }
}
