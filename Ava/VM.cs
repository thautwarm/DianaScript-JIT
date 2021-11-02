using System.Collections.Generic;
using System;
using System.Linq;
using System.Runtime.CompilerServices;

namespace Ava
{
    using static VMExts;

    public enum CONT
    {
        NORMAL = 0,
        Break = 1,
        CONTINUE = 2,
        RETURN = 3
    }

    [Serializable]
    public enum BC
    {
        LOAD_GLOBAL,
        LOAD_GLOBAL_REF,
        STORE_GLOBAL,
        LOAD_LOCAL,
        LOAD_LOCAL_REF,
        STORE_LOCAL,

        LOAD_FREE,
        LOAD_FREE_REF,
        STORE_FREE,

        STORE_ITEM,
        LOAD_ITEM_REF,
        LOAD_ITEM,
        WRITE,
        WRITE_NOPOP, // (target, value) no pop value
        READ,
        READ_NOPOP, // (targte) no pop target
        CALL_FUNC,
        CALL_PRIME2,
        GOTO,
        GOTO_IF_NOT,
        GOTO_IF_AND_NO_POP,
        GOTO_IF_NOT_AND_NO_POP,
        NOT,
        PUSHCONST,
        RETURN,
        RAISE,
        DUP,
        POP,
        MK_FUNC,
        MK_LIST,
        MK_TUPLE,
        MK_DICT,
        NEG,
        INV,
        MK_STRDICT,
        FOR,
        GET_NEXT,
        BADD,
        BSUB,
        BLT,
    }

    public static class VMExts
    {
        public const int PSEUDO = 0;
    }

    public static class ListExt
    {
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void Push<T>(this List<T> self, T o)
        {
            self.Add(o);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]

        public static T Peek<T>(this List<T> self)
        {
            return self[self.Count - 1];
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static T Pop<T>(this List<T> self)
        {
            var i = self.Count - 1;
            var a = self[i];
            self.RemoveAt(i);
            return a;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static (T, T) Pop2<T>(this List<T> self)
        {
            var i = self.Count - 1;
            var a = self[i-1];
            var b = self[i];
            self.RemoveAt(i);
            self.RemoveAt(i-1);
            return (a, b);
        }
    }
    public class VM
    {
        public CodeObject co;
        public DObj[] localvars;
        public DObj[] freevars;
        public Dictionary<string, DObj> nameSpace;
        public List<DObj> vstack;
        public int offset;


        public VM(CodeObject codeObject, DObj[] localvars, DObj[] freevars, Dictionary<string, DObj> nameSpace)
        {
            vstack = new List<DObj>();
            offset = 0;

            co = codeObject;
            this.localvars = localvars;
            this.freevars = freevars;
            this.nameSpace = nameSpace;
        }
        public DObj loadvar(int i)
        {
            DObj r;
            if (i < 0)
            {   
                i = -i -1;
                r =  freevars[i];
                if (r == null)
                    throw new NameError("free", co.freenames[i]);
                return r;
            }
            r = localvars[i];
            if (r == null)
                    throw new NameError("local", co.localnames[i]);
            return r;
        }

        public void storevar(int i, DObj v)
        {
            if (i < 0)
            {
                freevars[-i - 1] = v;
                return;
            }
            localvars[i] = v;
        }


        public DObj execute()
        {
            try
            {
                return _execute();
                // return DNone.unique;
            }
            catch (Exception e)
            {
                // var s = String.Join(",",  co.sourcePos.Select(x => (x.Item1, x.Item2.line)));
                // Console.WriteLine($"{offset}, {s}");
                // throw;
                SourcePos pos = co.pos;
                foreach(var (off, pos_) in co.sourcePos)
                {
                    if (offset < off)
                        break;
                    pos = pos_;
                }
                // Console.WriteLine(pos.line);
                throw new DianaVMError(e, pos);
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        DObj _execute()
        {

            var bytecode = co.bytecode;
            var end = bytecode.Length;
            head:
            if (offset < end)
            {
                switch (bytecode[offset])
                {
                    case (int) BC.NEG:
                    {
                        vstack.Push(vstack.Pop().__neg__());
                        offset += 1;
                        goto head;
                    }

                    case (int) BC.NOT:
                    {
                        var i = vstack.Count-1;
                        vstack[i] = MK.Int(!(vstack[i].__bool__()));
                        offset += 1;
                        goto head;
                    }
                    case (int) BC.INV:
                    {
                        vstack.Push(vstack.Pop().__inv__());
                        offset += 1;
                        goto head;
                    }
                    
                    case (int) BC.BLT:
                    {
                        var i = vstack.Count-1;
                        vstack[i - 1] = MK.Int(vstack[i - 1].__lt__(vstack[i]));
                        vstack.RemoveAt(i);
                        offset += 1;
                        goto head;
                    }
                    case (int) BC.BADD:
                    {
                        
                        var i = vstack.Count-1;
                        var r = vstack[i];
                        vstack[i - 1] = vstack[i - 1].__add__(r);
                        vstack.RemoveAt(i);
                        // var (l, r) = vstack.Pop2();
                        // vstack.Push(l.__add__(r));
                        offset += 1;
                        goto head;
                    }

                    case (int) BC.BSUB:
                    {
                        var (l, r) = vstack.Pop2();
                        vstack.Push(l.__sub__(r));
                        offset += 1;
                        goto head;
                    }
                    case (int) BC.MK_STRDICT:
                    {
                        var n = bytecode[offset + 1];
                        var xs = new Dictionary<string, DObj>();

                        for(int i = 0; i< n; i++)
                        {
                            var v = vstack.Pop();
                            var k = (string) (DString) vstack.Pop();  
                            if(!xs.ContainsKey(k))
                                xs[k] = v;
                        }
                        
                        vstack.Push(MK.StrDict(xs));
                        offset += 2;
                        goto head;
                    }
                    case (int) BC.MK_DICT:
                    {
                        var n = bytecode[offset + 1];
                        var xs = new Dictionary<DObj, DObj>();

                        for(int i = 0; i< n; i++)
                        {
                            var (k, v) = vstack.Pop2();  
                            if(!xs.ContainsKey(k))
                                xs[k] = v;
                        }
                        
                        vstack.Push(MK.Dict(xs));
                        offset += 2;
                        goto head;
                    }
                    case (int) BC.MK_LIST:
                    {
                        var n = bytecode[offset + 1];
                        var xs = new List<DObj>();

                        for(int i = 0; i< n; i++)
                            xs.Add(vstack.Pop());
                        xs.Reverse();
                        vstack.Push(MK.List(xs));
                        offset += 2;
                        goto head;
                    }
                    case (int) BC.MK_TUPLE:
                    {
                        var n = bytecode[offset + 1];
                        var xs = new DObj[n];

                        for(int i = n-1; i >= 0; i--)
                            xs[i] = vstack.Pop();
                        vstack.Push(MK.Tuple(xs));
                        offset += 2;
                        goto head;
                    }
                    case (int) BC.LOAD_GLOBAL:
                    {
                        var s = co.strings[bytecode[offset + 1]];
                        if (nameSpace.TryGetValue(s, out var v))
                            vstack.Push(v);
                        else
                            throw new NameError("global", s);
                        offset += 2;
                        goto head;
                    }

                    case (int) BC.STORE_GLOBAL:
                    {
                        var s = co.strings[bytecode[offset + 1]];
                        nameSpace[s] = vstack.Pop();
                        offset += 2;
                        goto head;
                    }

                    case (int) BC.LOAD_GLOBAL_REF:
                    {
                        var s = co.strings[bytecode[offset + 1]];
                        vstack.Push(new GlobalRef(s));
                        offset += 2;
                        goto head;
                    }

                    case (int) BC.LOAD_FREE:
                    {
                        var r = freevars[bytecode[offset + 1]];
                        if (r == null)
                            throw new NameError("free", co.freenames[bytecode[offset + 1]]);
                        vstack.Push(r);
                        offset += 2;
                        goto head;
                    }

                    case (int) BC.STORE_FREE:
                    {
                        freevars[bytecode[offset + 1]] = vstack.Pop();
                        offset += 2;
                        goto head;
                    }

                    case (int) BC.LOAD_FREE_REF:
                    {
                        vstack.Push(new FreeRef(bytecode[offset + 1]));
                        offset += 2;
                        goto head;
                    }

                    case (int) BC.LOAD_LOCAL:
                    {
                        var r = localvars[bytecode[offset + 1]];
                        if (r == null)
                            throw new NameError("local", co.localnames[bytecode[offset + 1]]);
                        vstack.Push(r);
                        offset += 2;
                        goto head;
                    }

                    case (int) BC.LOAD_LOCAL_REF:
                    {
                        vstack.Push(new StackRef(bytecode[offset + 1]));
                        offset += 2;
                        goto head;
                    }

                    case (int) BC.STORE_LOCAL:
                    {
                        localvars[bytecode[offset + 1]] = vstack.Pop();
                        offset += 2;
                        goto head;
                    }

                    case (int) BC.LOAD_ITEM:
                    {
                        var item = vstack.Pop();
                        var subject = vstack.Pop();
                        vstack.Push(subject.__get__(item));
                        offset += 1;
                        goto head;
                    }
                    case (int) BC.LOAD_ITEM_REF:
                    {
                        var item = vstack.Pop();
                        var subject = vstack.Pop();
                        vstack.Push(new ItemRef(subject, item));
                        offset += 1;
                        goto head;
                    }

                    case (int) BC.STORE_ITEM:
                    {
                        var value = vstack.Pop();
                        var item = vstack.Pop();
                        var subject = vstack.Pop();
                        subject.__set__(item, value);
                        offset += 1;
                        goto head;
                    }

                    case (int) BC.WRITE:
                    {
                        var value = vstack.Pop();
                        var r = vstack.Pop();
                        r.SetContentsVM(this, value);
                        offset += 1;
                        goto head;
                    }
                    case (int) BC.WRITE_NOPOP:
                    {
                        var value = vstack.Pop();
                        var r = vstack.Pop();
                        r.SetContentsVM(this, value);
                        vstack.Push(value);
                        offset += 1;
                        goto head;
                    }
                    case (int) BC.READ:
                    {
                        var r = vstack.Pop();
                        vstack.Push(r.GetContentsVM(this));
                        offset += 1;
                        goto head;
                    }

                    case (int) BC.READ_NOPOP:
                    {
                        var r = vstack.Peek();
                        vstack.Push(r.GetContentsVM(this));
                        offset += 1;
                        goto head;
                    }

                    case (int) BC.CALL_FUNC:
                    {
                        var n = bytecode[offset + 1];
                        var arr = new DObj[n];
                        for(var i = n - 1; i >= 0; i--)
                        {
                            arr[i] = vstack.Pop();
                        }
                        var f = vstack.Pop();
                        vstack.Push(f.__call__(arr));
                        offset += 2;
                        goto head;
                    }

                    case (int) BC.CALL_PRIME2:
                    {
                        var arg2 = vstack.Pop();
                        var arg1 = vstack.Pop();
                        vstack.Push(Prime2.callfunc2(bytecode[offset + 1], arg1, arg2));
                        offset += 2;
                        goto head;
                    }

                    case (int) BC.GOTO:
                    {
                        offset = bytecode[offset + 1];
                        goto head;
                    }

                    case (int) BC.GOTO_IF_NOT:
                    {
                        if(!vstack.Pop().__bool__())
                            offset = bytecode[offset + 1];
                        else
                        {
                            offset += 2;
                        }
                        goto head;
                    }

                    case (int) BC.GOTO_IF_AND_NO_POP:
                    {
                        var value = vstack.Pop();
                        if(value.__bool__())
                        {
                            vstack.Push(value);
                            offset = bytecode[offset + 1];
                        }
                        else
                        {
                            offset += 2;
                        }
                        goto head;
                    }
                    case (int) BC.GOTO_IF_NOT_AND_NO_POP:
                    {
                        var value = vstack.Pop();
                        if(!value.__bool__())
                        {
                            offset = bytecode[offset + 1];
                        }
                        else
                        {
                            vstack.Push(value);
                            offset += 2;
                        }
                        goto head;
                    }

                    case (int) BC.PUSHCONST:
                        vstack.Push(co.consts[bytecode[offset + 1]]);
                        offset += 2;
                        goto head;
                    case (int) BC.RETURN:
                        return vstack.Pop();

                    case (int) BC.RAISE:
                        throw new ValueError(vstack.Pop().__str__());
                    case (int) BC.DUP:
                        vstack.Push(vstack.Peek());
                        offset += 1;
                        goto head;
                    case (int) BC.POP:
                        vstack.Pop();
                        offset += 1;
                        goto head;
                    case (int) BC.MK_FUNC:
                    {
                        var code = (CodeObject) vstack.Pop();
                        var freevars = new DObj[code.freenames.Length];
                        var n = bytecode[offset + 1];
                        for(int i = 0; i < n; i++)
                        {
                            var j = offset + 2 + i + i;
                            var from = bytecode[j];
                            var to = bytecode[j+1];
                            freevars[to] = loadvar(from);
                        }
                        vstack.Push(new DObjectFunc(code, freevars, nameSpace));
                        offset += 2 + n + n;
                        goto head;
                    }
                    case (int) BC.FOR:
                    {
                        var o = vstack.Pop();
                        vstack.Push(new DEnum(o.__iter__().GetEnumerator()));
                        offset += 1;
                        goto head;
                    }

                    case (int) BC.GET_NEXT:
                    {
                        var o = vstack.Peek();
                        o = o.__next__();
                        if (o == null)
                        {
                            offset = bytecode[offset + 1];
                            vstack.Pop();
                            goto head;
                        }
                        else
                        {
                            vstack.Push(o);
                        }
                        offset += 2;
                        goto head;
                    }
                    default:
                    throw new NotImplementedException();
                }
            }
            if (vstack.Count != 0)
                return vstack.Pop();
            return DNone.unique;
        }
    }

    public record StackRef(int idx) : DObj
    {
        public string Classname => "stackref";
        public object Native => this;
        public DObj GetContentsVM(VM vm) => vm.localvars[idx];
        public void SetContentsVM(VM vm, DObj v)
        {
            vm.localvars[idx] = v;
        }

    }

    public record FreeRef(int idx) : DObj
    {
        public string Classname => "freeref";
        public object Native => this;
        public DObj GetContentsVM(VM vm) => vm.freevars[idx];
        public void SetContentsVM(VM vm, DObj v)
        {
            vm.freevars[idx] = v;
        }

    }

    public record ItemRef(DObj subject, DObj item) : DObj
    {
        public string Classname => "stackref";
        public object Native => this;
        public DObj GetContentsVM(VM vm) => subject.__get__(item);
        public void SetContentsVM(VM vm, DObj v) => subject.__set__(item, v);
    }

    public record GlobalRef(string key): DObj
    {
        public string Classname => "globalref";
        public object Native => this;
        public DObj GetContentsVM(VM vm) =>
            (vm.nameSpace.TryGetValue(key, out var v))? v : throw new NameError("global", key);
        public void SetContentsVM(VM vm, DObj v) => vm.nameSpace[key] = v;
    }

    [Serializable]
    public struct SourcePos
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
    public class AttrRef : DObj
    {
        public DObj value;
        public DObj item;
        public string Classname => "stackref";
        public object Native => this;
        public AttrRef(DObj value, DObj item)
        {
            this.value = value;
            this.item = item;
        }
        public DObj GetContents() => value.__get__(item);
        public void SetContents(DObj v) => value.__set__(item, v);
    }

    [Serializable]
    public class DObjectFunc : DObj
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

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public DObj __call__(DObj[] args)
        {
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
            return new VM(co, locals, freevars, nameSpace).execute();
        }

    }
    [Serializable]
    public record CodeObject(
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
            while(offset < bytecode.Length)
            {
                writeLine(offset + ":");
                var b = (BC) bytecode[offset];
                switch(b)
                {
                    case BC.CALL_FUNC:
                        writeLine(BC.CALL_FUNC + " " + bytecode[offset+1]);
                        offset += 2;
                        continue;
                    case BC.CALL_PRIME2:
                        writeLine(BC.CALL_PRIME2 + " " + bytecode[offset+1]);
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
                    case BC.WRITE:
                    case BC.READ:
                    case BC.RAISE:
                    case BC.RETURN:
                    case BC.WRITE_NOPOP:
                    case BC.READ_NOPOP:
                    case BC.LOAD_ITEM:
                    case BC.POP:
                    case BC.LOAD_ITEM_REF:
                        writeLine(b);
                        offset += 1;
                        continue;
                    case BC.LOAD_LOCAL:
                    case BC.LOAD_LOCAL_REF:
                    case BC.STORE_LOCAL:
                        var off = bytecode[offset + 1];
                        var lcn = localnames[off];
                        writeLine(b + " " + lcn);
                        offset += 2;
                        continue;
                    case BC.LOAD_FREE:
                    case BC.LOAD_FREE_REF:
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
                    case BC.LOAD_GLOBAL_REF:
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
                        writeLine(b + " "+ bytecode[offset + 1]);
                        offset += 2;
                        continue;
                    case BC.PUSHCONST:
                        writeLine(b + " "+ consts[bytecode[offset + 1]].__str__());
                        offset += 2;
                        continue;
                    case BC.MK_FUNC:
                        var ninc = bytecode[offset + 1];
                        writeLine(b + " "+ ninc);
                        offset += ninc + 2 + ninc;
                        continue;
                    default:
                        writeLine($"<< {b}");
                        offset += 1;
                        continue;
                }
            }

            foreach(var code in consts)
            {
                if (code is CodeObject codeo)
                {
                    codeo.ShowCode(indent + "    ");
                }
            }
        }
    }
}