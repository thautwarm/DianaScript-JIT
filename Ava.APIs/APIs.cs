using System.Collections;
using System.Collections.Generic;
using System;
using System.Linq;
using Ava;

namespace Ava
{

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
            if (o is TypeObject_v1 t)
            {
                if (t.methods == null)
                {
                    return MK.Tuple(new DObj[0]);
                }
                return MK.Tuple(t.methods.Keys.Select(x => MK.String(x)).ToArray());
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

        public DObj isdefined(DObj s)
        {
            return MK.Int(G.ContainsKey(((DString)s).value));
        }

        private Dictionary<string, DObj> G;
        public Dictionary<string, DObj> InitGlobals()
        {

            if (G != null)
                return G;

            DInt.SetupType();
            DFloat.SetupType();
            DList.SetupType();
            DDict.SetupType();
            DString.SetupType();

            DInt.classobject.methods["__call__"] = MK.FuncN("int", IntType.__call__);
            DFloat.classobject.methods["__call__"] = MK.FuncN("float", FloatType.__call__);
            DString.classobject.methods["__call__"] = MK.FuncN("str", StrType.__call__);
            G = new Dictionary<string, DObj>
            {
                {"log", MK.FuncN("log", log)},
                {"typeof", MK.Func1("typeof", classname)},
                {"time", MK.Func0("time", time)},
                {"assert",  MK.FuncN("assert", assert)},
                {"keys", MK.Func1("keys", keys)},
                {"len", MK.Func1("len", len)},
                {"int", DInt.classobject},
                {"float", DFloat.classobject},
                {"str", DString.classobject},
                {"list", DList.classobject},
                {"dict", DDict.classobject},
                {"isdefined", MK.Func1("isdefined", isdefined)}

            };
            return G;
        }
    }
}