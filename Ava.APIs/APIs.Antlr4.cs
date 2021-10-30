using System.Collections;
using System.Collections.Generic;
using System;
using System.Linq;
using Ava.Frontend;
using Antlr4.Runtime;
using Antlr4.Runtime.Tree;

namespace Ava
{
    public partial class DianaScriptAPIs
    {
        public static ImmediateAST Parse(string path)
        {
            ICharStream stream = CharStreams.fromPath(path);
            DianaScriptLexer lexer = new DianaScriptLexer(stream);
            ITokenStream tokens = new CommonTokenStream(lexer);
            var parser = new DianaScriptParser(tokens);
            parser.RemoveErrorListeners();
            parser.AddErrorListener(ParserErrorListener.Instance);
            lexer.RemoveErrorListeners();
            lexer.AddErrorListener(LexerErrorListener.Instance);
            try
            {
                var result = parser.start().result.ToArray();
                return Block.make(result, 0, 0);
            }
            catch (ParseException e)
            {
                throw new ParseException($"parsing {path} failed:\n {e.Message}");
            }
        }
    }
}