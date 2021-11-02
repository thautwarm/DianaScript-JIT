using Antlr4.Runtime;
using Antlr4.Runtime.Tree;
using System.Collections.Generic;
using System;
using System.Linq;
using System.Text.RegularExpressions;

using ast = Ava.ImmediateAST;
namespace Ava.Frontend
{

    using Option = ValueTuple<int, int, string, List<ImmediateAST>>;
    public struct Pos
    {
        public int lineno;
        public int colno;
        public string filename;
    }

    public partial class DianaScriptParser
    {
        public static OperatorResolver<(int, int, string), ast> operatorSolver = new OperatorResolver<(int lineno, int colno, string opname), ast>(
            (tpl, l, r) => Bin.make(l, tpl.opname, r, tpl.lineno, tpl.colno)
        );

        public static List<A> append<A>(List<A> lst, A a)
        {
            lst.Add(a);
            return lst;
        }

        public static List<A> extend<A>(List<A> lst, List<A> a)
        {
            lst.AddRange(a);
            return lst;
        }
        public static List<A> empty<A>()
        {
            return new List<A>();
        }

        public static ast resolve_binop(List<object> ops)
        {
            if (ops.Count == 1)
            {
                return (ast)ops[0];
            }
            return operatorSolver.binopReduce(ops);
        }

        public static object to_obj<A>(A o) => o;
        public static string unesc(string s) =>
        Regex.Unescape(s.Substring(1, s.Length - 2));

        public static Pos posOfToken(CommonToken token) => new Pos { lineno = token.Line, colno = token.Column, filename = token.TokenSource.SourceName };
        public static ast mkOGet(CommonToken token, ast ast1, ast ast2)
        => OGet.make(ast1, ast2, token.Line, token.Column);

        public static ast mkOSet(CommonToken token, ast ast1, ast ast2, ast ast3)
        => OSet.make(ast1, ast2, ast3, token.Line, token.Column);

        public static ast mkApp(CommonToken token, ast f, List<ast> args)
        => Call.make(f, args.ToArray(), token.Line, token.Column);

        public static ast mkList(CommonToken token, List<ast> elts)
        => CList.make(elts.ToArray(), token.Line, token.Column);

        public static ast mkTuple(CommonToken token, List<ast> elts, bool has_trailer)
        =>
        (elts.Count == 1 && !has_trailer) ?
        elts[0] :
        CTuple.make(elts.ToArray(), token.Line, token.Column);

        public static ast mkDict(CommonToken token, List<(ast, ast)> elts)
        => CDict.make(elts.ToArray(), token.Line, token.Column);

        public static ast mkStrDict(CommonToken token, List<(ast, ast)> elts)
        => CStrDict.make(elts.ToArray(), token.Line, token.Column);

        public static ast mkMeta(string idx, string l, string c, ast inner)
        => Meta.make(int.Parse(idx), inner, int.Parse(l), int.Parse(c));

        public static ast mkVar(CommonToken token, string name)
        => Load.make(name, token.Line, token.Column);

        public static ast mkVal(CommonToken token, DObj o)
        => CVal.make(o, token.Line, token.Column);

        public static ast mkIBin(CommonToken token, ImmediateAST target, string op, ImmediateAST value)
        => IBin.make(target, op, value, token.Line, token.Column);

        public static ast mkInv(CommonToken token, ast ast)
        => Inv.make(ast, token.Line, token.Column);

        public static ast mkNeg(CommonToken token, ast ast)
        => Neg.make(ast, token.Line, token.Column);

        public static ast mkNot(CommonToken token, ast ast)
        => Not.make(ast, token.Line, token.Column);

        public static ast mkAnd(CommonToken token, ast ast1, ast ast2)
        => And.make(ast1, ast2, token.Line, token.Column);

        public static ast mkOr(CommonToken token, ast ast1, ast ast2)
        => Or.make(ast1, ast2, token.Line, token.Column);

        public static DObj mkint(string s, int bit)
        {
            if (s.Length > 2)
            {
                return MK.Int(s.Substring(0, 2) switch
                {
                    "0x" => Convert.ToInt64(s.Substring(2), 16),
                    "0o" => Convert.ToInt64(s.Substring(2), 8),
                    "0b" => Convert.ToInt64(s.Substring(2), 2),
                    _ => long.Parse(s)
                });
            }
            return MK.Int(long.Parse(s));
        }

        public static DObj mkfloat(string s) =>
            MK.Float(float.Parse(s));

        public static DObj mkstr(string s) =>
            MK.String(s);




        public static DObj mknone() => MK.None();

        public static ast mkIfThen(CommonToken token, ast cond, ast then)
        {
            return IfThenElse.make(
                cond, then,
                CVal.make(MK.None(), token.Line, token.Column),
                token.Line, token.Column
            );
        }

        public static ast mkExprStmt(ast inner)
        {
            return ExprStmt.make(inner, inner.Lineno, inner.Colno);
        }

        public static ast mkRaise(CommonToken token, ast inner)
        {
            return Raise.make(inner, token.Line, token.Column);
        }

        public static ast mkBlock(CommonToken token, List<ast> suite)
        {
            return Block.make(
                suite.ToArray(),
                token.Line,
                token.Column
            );
        }

        public static ast mkFunc(CommonToken token, string name, List<string> args, List<ast> body)
        {
            return Function.make(name, args.ToArray(),
                mkBlock(token, body), token.Line, token.Column);
        }

        public static ast mkNestedIf(CommonToken token, List<(ast, ast)> elifs, ast orelse)
        {
            return NestedIf.make(elifs.ToArray(), orelse, token.Line, token.Column);
        }

        public static object mkop(CommonToken token, string opname)
        {
            return new Operator<(int lineno, int colno, string opname)>(opname, (token.Line, token.Column, opname));
        }

        public static ast mkStoreMany(List<ast> lhs, ast value)
        {
            if (lhs.Count == 0) return value;
            return StoreMany.make(lhs.ToArray(), value, lhs[0].Lineno, lhs[0].Colno);
        }

        public static ast mkReturn(CommonToken token, ast v)
        {
            return Return.make(v, token.Line, token.Column);
        }

        public static ast mkContinue(CommonToken token)
        {
            return Continue.make(token.Line, token.Column);
        }

        public static ast mkBreak(CommonToken token)
        {
            return Break.make(token.Line, token.Column);
        }

        public static ast mkLoop(CommonToken token, ast body)
        {
            return Loop.make(body, token.Line, token.Column);
        }

        public static ast mkFor(CommonToken token, string target, ast iter, ast body)
        {
            return For.make(target, iter, body, token.Line, token.Column);
        }

        public static ast mkWhile(CommonToken token, ast cond, ast body)
        {
            return While.make(cond, body, token.Line, token.Column);
        }

        // public static Option mkOption0(CommonToken token)
        // {
        //     return (token.Line, token.Column, token.Text, new List<ast>{
        //         CVal.make(MK.Int(1), token.Line, token.Column)
        //     });
        // }

        public static Option mkOptionN(CommonToken token, List<ast> args)
        {
            return (token.Line, token.Column, token.Text, args);
        }


        
        public static Option mkDoOption(ast expr)
        {
            return (expr.Lineno, expr.Colno, "do", new List<ast> { expr });
        }

        public static ast mkDecl(CommonToken token, List<string> names)
        {
            return Decl.make(names.ToArray(), token.Line, token.Column);
        }




    }

}