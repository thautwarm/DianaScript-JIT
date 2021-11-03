using System;
using System.Linq;
using System.Collections.Generic;
using System.Runtime.CompilerServices;


namespace Ava
{
    [Serializable]
    public class SourcePos
    {
        public int line;
        public int col;
        public string filename;
        public SourcePos(int l, int c, string f)
        {
            line = l;
            col = c;
            filename = f;
        }
        public void visit(MetaContext ctx)
        {

            if (ctx.sourcePos.Count == 0)
            {
                ctx.sourcePos.Add((-1, this));
                return;
            }
            var (_, p) = ctx.sourcePos[ctx.sourcePos.Count - 1];
            if (p.line == line && p.col == col && p.filename == filename)
                return;
            ctx.sourcePos.Add((ctx.bytecode.Count, this));
        }
    }


    [Serializable]
    public sealed class DObjectFunc : DObj
    {
        public CodeObject co;
        public DObj[] freevars;
        public Dictionary<string, DObj> nameSpace;
        public string Classname => "object";

        public object Native => this;
        public DObjectFunc(CodeObject co, DObj[] freevars, Dictionary<string, DObj> nameSpace)
        {
            this.co = co;
            this.freevars = freevars;
            this.nameSpace = nameSpace;
        }
        public string __str__() => co.name;

        public DObj __call__(DObj[] args)
        {
            if (args.Length < co.narg)
            {
                throw new ArgumentException($"function {co.name} requires {co.narg} argument(s) but got {args.Length}.");
            }
            DObj[] locals;
            if (co.nlocal == args.Length)
            {
                locals = args;
            }
            else
            {
                locals = new DObj[co.nlocal];
                args.CopyTo(locals, 0);
            }
            return VM.execute(co, locals, freevars, nameSpace);
        }

    }
    [Serializable]
    public sealed record CodeObject(
        string name,
        DObj[] consts,
        int[] bytecode,
        string[] strings,
        string[] localnames,
        string[] freenames,
        (int, SourcePos)[] sourcePos,
        SourcePos pos,
        int narg,
        int nlocal
        ) : DObj
    {
        public object Native => this;

        public string Classname => "code";

        public string __str__() => $"<codeobj {name}>";

        public bool __eq__(DObj o)
        {
            return (o is CodeObject code) && code == this;
        }

        public void ShowCode(string indent = "")
        {
            int offset = 0;
            void writeLine(object s)
            {
                Console.WriteLine(indent + s);
            }
            writeLine("consts:" + MK.List(consts.ToList()).__str__());

            writeLine("strings:" + String.Join(",", strings));
            Console.WriteLine("name:" + name);
            while (offset < bytecode.Length)
            {
                writeLine(offset + ":");
                var b = (BC)bytecode[offset];
                switch (b)
                {
                    case BC.CALL_FUNC:
                        writeLine(BC.CALL_FUNC + " " + bytecode[offset + 1]);
                        offset += 2;
                        continue;
                    case BC.CALL_PRIME2:
                        writeLine(BC.CALL_PRIME2 + " " + bytecode[offset + 1]);
                        offset += 2;
                        continue;
                    case BC.GET_NEXT:
                        writeLine(BC.GET_NEXT + " " + bytecode[offset + 1]);
                        offset += 2;
                        continue;
                    case BC.GOTO:
                    case BC.GOTO_IF_AND_NO_POP:
                    case BC.GOTO_IF_NOT:
                    case BC.GOTO_IF_NOT_AND_NO_POP:
                        writeLine(b + " " + bytecode[offset + 1]);
                        offset += 2;
                        continue;
                    case BC.DUP:
                    case BC.FOR:
                    case BC.INV:
                    case BC.NEG:
                    case BC.NOT:
                    case BC.RAISE:
                    case BC.RETURN:

                    case BC.LOAD_ITEM:
                    case BC.POP:
                        writeLine(b);
                        offset += 1;
                        continue;
                    case BC.LOAD_LOCAL:
                    case BC.STORE_LOCAL:
                        var off = bytecode[offset + 1];
                        var lcn = localnames[off];
                        writeLine(b + " " + lcn);
                        offset += 2;
                        continue;
                    case BC.LOAD_FREE:
                    case BC.STORE_FREE:
                        off = bytecode[offset + 1];
                        lcn = freenames[off];
                        writeLine(b + " " + lcn);
                        offset += 2;
                        continue;

                    case BC.LOAD_GLOBAL:
                        off = bytecode[offset + 1];
                        lcn = strings[off];
                        writeLine(b + " " + lcn);
                        offset += 2;
                        continue;
                    case BC.STORE_GLOBAL:
                        off = bytecode[offset + 1];
                        lcn = strings[off];
                        writeLine(b + " " + lcn);
                        offset += 2;
                        continue;
                    case BC.MK_DICT:
                    case BC.MK_STRDICT:
                    case BC.MK_TUPLE:
                    case BC.MK_LIST:
                    case BC.MK_SET:
                        writeLine(b + " " + bytecode[offset + 1]);
                        offset += 2;
                        continue;
                    case BC.PUSHCONST:
                        writeLine(b + " " + consts[bytecode[offset + 1]].__str__());
                        offset += 2;
                        continue;
                    case BC.MK_FUNC:
                        var ninc = bytecode[offset + 1];
                        writeLine(b + " " + ninc);
                        offset += ninc + 2 + ninc;
                        continue;
                    default:
                        writeLine($"<< {b}");
                        offset += 1;
                        continue;
                }
            }

            foreach (var code in consts)
            {
                if (code is CodeObject codeo)
                {
                    codeo.ShowCode(indent + "    ");
                }
            }
        }
    }
}