using System.Collections;
using System.Collections.Generic;
using System;
using System.Linq;
using Diana;

namespace Diana
{

    using NameSpace = Dictionary<string, DObj>;
    using CPS = Func<ExecContext, DObj>;
    using ast = ImmediateAST;

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

    public partial class DianaScriptAPIs
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

        public static DObj len(DObj arg)
        {
            return MK.Int(arg.__len__());
        }

        public static DObj keys(DObj o)
        {
            if (o is DModule t)
            {
                if (t.fields == null)
                {
                    return MK.Tuple(new DObj[0]);
                }
                return MK.Tuple(t.fields.Keys.Select(x => MK.String(x)).ToArray());
            }
            if (o is DDict d)
            {
                return MK.Tuple(d.dict.Keys.ToArray());
            }
            throw new TypeError($"cannot inspect keys from {o.Classname} object.");
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

        public Dictionary<string, DObj> InitGlobals()
        {
            
            var ns = new Dictionary<string, DObj>
            {
                {"log", MK.FuncN("log", log)},
                {"typeof", MK.Func1("typeof", classname)},
                {"time", MK.Func0("time", time)},
                {"assert",  MK.FuncN("assert", assert)},
                {"keys", MK.Func1("keys", keys)},
                {"len", MK.Func1("len", len)},
                {DInt.module_instance.name, DInt.module_instance},
                {DFloat.module_instance.name, DFloat.module_instance},
                {DString.module_instance.name, DString.module_instance},
                {DList.module_instance.name, DList.module_instance},
                {DDict.module_instance.name, DDict.module_instance},
                {DIterable.module_instance.name, DIterable.module_instance},
            };

            DObj isdefined(DObj s)
            {
                return MK.Int(ns.ContainsKey(((DString)s).value));
            }

            ns.Add("isdefined", MK.Func1("isdefined", isdefined));

            return ns;
        }

        public static Func<NameSpace, DObj> compileModule(ast ast, string path, string name = null)
        {
            name = name ?? System.IO.Path.GetFileNameWithoutExtension(path);
            var ctx = MetaContext.Create(path);
            var cps = ast.jit_impl(ctx);
            var co = ctx.jitCode(ctx.currentPos, new string[0], name).Item2;
            return ns => ExecContext.ExecTopLevel(cps, ns, co);
        }

    }
}