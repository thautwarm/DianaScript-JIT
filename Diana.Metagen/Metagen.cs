using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using Diana;
#if !NUNITY
using UnityEngine;
#endif


namespace Diana.Metagen
{
    public class ClassAttribute : Attribute { }
    public class BindAttribute : Attribute { }
    public class ConverterAttribute : Attribute { }
    public class Metagen
    {
        const int BIT_GETTER = 0b01;
        const int BIT_SETTER = 0b10;
        Dictionary<(Type, Type), string> converters;
        Dictionary<Type, (string, int, Type)[]> bindings;
        
        Assembly asm;
        string nameSpace;
        string outDir;
        public Metagen(Assembly asm, string nameSpace, string outDir)
        {
            this.asm = asm;
            this.nameSpace = nameSpace;
            this.outDir =
#if NUNITY
                outDir;
#else
                Path.Combine(Application.dataPath, outDir);
#endif

#if CODEGEN
    CheckCache();
#endif
        
        }


#if CODEGEN
        string search_converter(Type from, Type to)
        {
            if (from == to)
                return "";
            
            var key = (from, to);
            if (converters.TryGetValue(key, out var ret))
                return ret;
            // warning
            return "";
        }

        void CheckCache()
        {
            converters = new Dictionary<(Type, Type), string>();
            bindings = new Dictionary<Type, (string, int, Type)[]>();
            
            
            var typename = String.Empty;

            foreach (var type in asm.GetClasses(nameSpace))
            {
                if (type.GetCustomAttribute<ConverterAttribute>() != null)
                    goto handle_converter;
                else if (type.GetCustomAttribute<ClassAttribute>() != null)
                    goto handle_diana_class;

                handle_converter:
                foreach (var mi in type.GetMethods(BindingFlags.Public | BindingFlags.Static))
                {
                    if (mi.GetCustomAttribute<ConverterAttribute>() == null || mi.GetParameters().Length != 1)
                        continue;
                    var pi = mi.GetParameters()[0];
                    var argtype = pi.ParameterType;
                    var rettype = mi.ReturnType;
                    converters[(argtype, rettype)] = string.Format(
                        "{0}.{1}.{2}",
                        mi.ReflectedType.Namespace,
                        mi.ReflectedType.Name,
                        mi.Name);
                }
                continue;

                handle_diana_class:;
                
                var class_bindings = new List<(string, int, Type)>();
                foreach (var propInfo in type.GetProperties(BindingFlags.Public | BindingFlags.Instance | BindingFlags.Static))
                {
                    
                    if (propInfo.GetCustomAttribute<BindAttribute>() != null)
                    {
                        var propType = propInfo.PropertyType;
                        var bit = 0;
                        if(propInfo.CanRead)
                            bit |= BIT_GETTER;
                        if(propInfo.CanWrite)
                            bit |= BIT_SETTER;
                        class_bindings.Add((propInfo.Name, bit, propType));
                    }
                }
                bindings[type] = class_bindings.ToArray();
                continue;
            }
            
            var bindings_ = asm.GetType($"{nameSpace}.MetagenMeta")?.GetStaticField<Dictionary<Type, (string, int, Type)[]>>("bindings");
            
            
            if (bindings_ != null && bindings_.SequenceEqual(bindings))
                return;
            // do code generation

            GenerateMeta();
            GenerateBinding();
        }
        

        void GenerateBinding()
        {
            foreach(var (cls, pairs) in bindings)
            {
                GenerateBindingForClass(cls, pairs);
            }
        }
        void GenerateBindingForClass(Type cls, (string, int, Type)[] pairs)
        {

            var srcPath = Path.Combine(outDir, $"{cls.Name}.Binding.cs");
            var required_namespaces = new HashSet<string> { "System", "System.Collections.Generic" };
            string err_msg;
            var sb = new StringBuilder();
            
            sb.AddLines($"namespace {nameSpace} {{");
            sb.AddLines($"public partial class {cls.Name} {{");

            sb.AddLines(
                $"    public DObj __get__(DObj __attrobj)",
                @"    {",
                @"         var __attr = (string) (DString) __attrobj;",
                @"         switch(__attr){");
            foreach(var (fieldname, bit, fieldtype) in pairs)
            {
                if ((bit & BIT_GETTER) == 0)
                    continue;
                var conv = search_converter(fieldtype, typeof(DObj));
                sb.AddLines(
                    $"         case \"{fieldname}\":",
                    $"               return {conv}({fieldname});");
                
            }

            err_msg = $"cannot get attribute ({{__attr}}) from {cls.Name}";
            sb.AddLines(
                    $"         default:",
                    $"               throw new AttributeError($\"{err_msg}\");");
            
            sb.AddLines(
                @"         }",
                @"    }"
                
            );


            sb.AddLines(
                $"    public void __set__(DObj __attrobj, DObj __value)",
                @"    {",
                @"         var __attr = (string) (DString) __attrobj;",
                @"         switch(__attr){");
            foreach(var (fieldname, bit, fieldtype) in pairs)
            {
                if ((bit & BIT_SETTER) == 0)
                    continue;
                var conv = search_converter(typeof(DObj), fieldtype);
                sb.AddLines(
                    $"         case \"{fieldname}\":",
                    $"               {fieldname} = {conv}(__value);",
                    @"               return;");
            }
            err_msg = $"cannot set attribute ({{__attr}}) from {cls.Name}";
            sb.AddLines(
                    $"         default:",
                    $"               throw new AttributeError($\"{err_msg}\");");
            
            sb.AddLines(
                @"         }",
                @"    }"
                
            );
            sb.AddLines("}"); // class
            sb.AddLines("}"); // namespace

            File.WriteAllText(
                srcPath,
                String.Join("\n", required_namespaces.ToList().OrderBy(x => x).Select(x => $"using {x};"))
                + "\n"
                + sb.ToString());
        }

        void GenerateMeta()
        {
            var srcPath = Path.Combine(outDir, "MetagenMeta.cs");
            var sb = new StringBuilder();
            
            var required_namespaces = new HashSet<string> { "System", "System.Collections.Generic" };
            
            sb.AddLines($"namespace {nameSpace} {{");

            sb.AddLines("public class MetagenMeta {");

            // sb.AddLines("public Dictionary<(Type, Type), string> converters = new Dictionary<(Type, Type), string> {");
            // foreach(var ((t1, t2), method_name) in converters)
            // {
            //     required_namespaces.Add(t1.Namespace);
            //     required_namespaces.Add(t2.Namespace);
            //     sb.AddLines(
            //         $"  {{(typeof({t1.GetQualifiedName()}), typeof({t2.GetQualifiedName()})), \"{method_name}\"}},"
            //     );
            // }
            // sb.AddLines("};");


            sb.AddLines("public Dictionary<Type, (string, int, Type)[]> bindings = new Dictionary<Type, (string, int, Type)[]> {");
            foreach(var (cls, pairs) in bindings)
            {
                required_namespaces.Add(cls.Namespace);
                sb.AddLines($"    {{typeof({cls.GetQualifiedName()}), new (string, int, Type)[]{{");
                foreach(var (fieldname, bit, fieldtype) in pairs)
                {
                    required_namespaces.Add(fieldtype.Namespace);
                    sb.AddLines($"        (\"{fieldname}\", {bit}, typeof({fieldtype.GetQualifiedName()})),");
                }
                sb.AddLines("    }},");        
            }
            sb.AddLines("};");


            sb.AddLines("}"); // end class
            sb.AddLines("}"); // end namespace
            
            File.WriteAllText(
                srcPath,
                String.Join("\n", required_namespaces.ToList().OrderBy(x => x).Select(x => $"using {x};"))
                + "\n"
                + sb.ToString());
        }
#endif
    }

    static class Helper
    {
        public static void AddLines(this StringBuilder self, params string[] args)
        {
            foreach(var arg in args)
            {
                self.Append(arg);
                self.Append("\n");
            }
        }
        public static T GetStaticField<T>(this Type self, string attr) where T : class
        {
            var o = self.GetField(attr, BindingFlags.Public | BindingFlags.Static);
            if (o == null)
                return null;
            return o.GetValue(null) as T;
        }

        public static string GetQualifiedName(this Type self)
        {
            return string.Format("{0}.{1}", self.Namespace, self.Name);
        }


        public static IEnumerable<Type> GetClasses(this Assembly asm, string nameSpace)
        {
            return asm.GetTypes()
                    .Where(type => type.Namespace == nameSpace);
        }
    }

}