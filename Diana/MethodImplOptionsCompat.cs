using System.Runtime.CompilerServices;
namespace Diana
{
    public static class MethodImplOptionsCompat
    {
        public const MethodImplOptions AggressiveInlining = MethodImplOptions.AggressiveInlining;
#if NUNITY
        public const MethodImplOptions AggressiveOptimization = MethodImplOptions.AggressiveOptimization;
#else
        public const  MethodImplOptions AggressiveOptimization = MethodImplOptions.AggressiveInlining;
#endif
    }
}