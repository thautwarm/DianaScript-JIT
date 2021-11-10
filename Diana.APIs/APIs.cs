using Diana;
using System.Collections;
using System.Collections.Generic;
using System;
using System.Linq;
using System.IO;

#if !NUNITY
using UnityEngine;
#endif

namespace Diana
{

    using NameSpace = Dictionary<string, DObj>;
    using ast = ImmediateAST;

#if NUNITY
    public static class Debug
    {
        public static void Log(string s)
        {
            Console.WriteLine(s);
        }
    }
#endif


    public static class ModularDianaExts
    {

        public static void SetValue(this NameSpace self, string v, DObj o)
        {
            self[v] = o;
        }
        public static void SetValue(this DModule self, string v, DObj o)
        {
            self.fields[v] = o;
        }

        public static DObj GetValue(this DModule self, string v)
        {
            return self.fields.TryGetValue(v, out var o) ? o : DNone.unique;
        }
        public static DObj GetValue(this NameSpace self, string v)
        {
            return self.TryGetValue(v, out var o) ? o : DNone.unique;
        }

    }

    public class ModularDiana
    {

#if CONSOLE
        public static void Main(string[] args)
        {
            var imps = new ModularDiana();
            args.ToList().ForEach(imps.LoadFromPath);
            main_calls.ForEach(runmain => runmain());
            main_calls.Clear();
        }
#endif

        public string ApplicationPath;
        static List<Action> init_calls;
        public Dictionary<string, DModule> ModuleCaches;

        public ModularDiana(string path = null)
        {
            ApplicationPath = path ?? Environment.CurrentDirectory;
            ModuleCaches = new Dictionary<string, DModule>();
            init_calls = new List<Action>();
        }


        public void Exec(string path)
        {
            LoadFromPath(path);
            init_calls.ForEach(runinit => runinit());
            init_calls.Clear();
        }

        DModule ExecFromPath(string appPath, string path)
        {
            var apis = new DianaScriptAPIs();
            var globals = apis.InitGlobals();
            var mod = new DModule(appPath);
            var exported = mod.fields;
            mod.fields = globals;
            SetupNameSpace(mod, appPath);

            var ast = DianaScriptAPIs.Parse(path);
            var exec = DianaScriptAPIs.compileModule(ast, path);
            exec(globals);

            var init = globals.GetValue("init");
            if (init is DStaticFunc f)
            {

                init_calls.Add(() => f.__call__());
            }

            var exports = globals.GetValue("exports");

            mod.fields = exported;
            if (exports is DDict dict)
            {
                foreach (var kv in dict.dict)
                {
                    mod.fields[(string)(DString)kv.Key] = kv.Value;
                }
            }
            return mod;
        }

        void SetupNameSpace(DModule mod, string appPath)
        {
            mod.SetValue("__path__", MK.String(appPath));
            mod.SetValue("module", mod);
            mod.SetValue("require", MK.Func1("require", x => Require(mod, (string)(DString)x)));
        }

        string AbsRelativePath(string relativeToAbs, string absPath)
        {
            return Path.GetFullPath(absPath, Path.GetDirectoryName(relativeToAbs));
        }



        string resolveAbsPathFromCurrent(DModule mod, string relPath)
        {
            string currentAppPath = (string)(DString)mod.GetValue("__path__");
            var currentAbsPath = Path.GetFullPath(currentAppPath, ApplicationPath);
            var absPath = AbsRelativePath(currentAbsPath, relPath);
            return absPath;
        }
        string getAppPath(string absPath)
        {
            return Path.GetRelativePath(ApplicationPath, absPath);
        }

        DModule ExecutePathWithNewModule(string absPath)
        {
            var appPath = getAppPath(absPath);
            if (ModuleCaches.TryGetValue(appPath, out var value))
                return value;
            var content = File.ReadAllText(absPath);
            return ExecFromPath(appPath, absPath);
        }

        public void ForceCacheModule(string absPath, DModule mod)
        {
            var appPath = getAppPath(absPath);
            ModuleCaches[appPath] = mod;
        }

        public void LoadFromPath(string relPath)
        {
            var absPath = Path.GetFullPath(relPath);
            ExecutePathWithNewModule(absPath);
        }

        DModule Require(DModule oldEngine, string relPath)
        {
            var absPath = resolveAbsPathFromCurrent(oldEngine, relPath);
            return ExecutePathWithNewModule(absPath);
        }
    }

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