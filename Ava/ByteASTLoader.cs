using System;
using System.IO;
using System.Collections.Generic;

namespace Ava
{
    public struct THint<A>
    {
        public static THint<A> val;
    }

    public static class ConstPoolTag
    {
        public const byte SpecialTag = 0b01 << 7;

        public const byte Int = 0;
        public const byte Float = 1;
        public const byte Str = 2;


        public const byte Dict = 3;
        public const byte Set = 4;
        public const byte List = 5;
        public const byte Tuple = 6;
    }


    public partial class ByteASTLoader
    {
        private BinaryReader binaryReader;
        private byte[] cache_4byte = new byte[4];
        private byte[] cache_32byte = new byte[32];

        public ByteASTLoader(FileStream fs)
        {
            binaryReader = new BinaryReader(fs);
        }

        public ByteASTLoader(string path)
        {
            var fs = File.Open(path, FileMode.Open);
            binaryReader = new BinaryReader(fs);
        }


        private DObj Read(THint<DObj> _) => throw new NotImplementedException("cannot deserialize external dobjects!");

        private (int, int, string, ImmediateAST[]) Read(THint<(int, int, string, ImmediateAST[])> _) => throw new NotImplementedException();

        public (ImmediateAST, ImmediateAST) Read(THint<(ImmediateAST, ImmediateAST)> _) =>
            (ReadImmediateAST(), ReadImmediateAST());

        public (int, int) Read(THint<(int, int)> _)
        {
            return (ReadInt(), ReadInt());
        }

        public string Read(THint<string> _)
        {
            return ReadStr();
        }

        public int Read(THint<int> _) => ReadInt();

        public Int64 Read(THint<Int64> _) => ReadInt();

        public int ReadTag() => binaryReader.ReadByte();

        public int ReadInt()
        {
            var i = binaryReader.ReadInt32();
#if A_DBG
            Console.WriteLine($"parse integer: '{i}'");
#endif
            return i;
        }

        public float Read(THint<float> _) => ReadFloat();

        public float ReadFloat()
        {
            var f = binaryReader.ReadSingle();
#if A_DBG
            Console.WriteLine($"parse float: '{f}'");
#endif
            return f;
        }

        // public InternString Read(THint<InternString> _) => ReadInternString();

        public string Readstring() => ReadStr();

        public string ReadStr()
        {
            var s = binaryReader.ReadString();
#if A_DBG
            Console.WriteLine($"parse string: '{s}'");
#endif
            return s;
        }

        public bool Read(THint<bool> _) => ReadBool();

        public bool ReadBool()
        {
            return ReadInt() == 0 ? false : true;
        }
    }
}