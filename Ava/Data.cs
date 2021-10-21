using System;
using System.IO;
using System.Collections;
using System.Collections.Generic;


namespace Ava
{

public partial class Store
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "Store";

    public int lineno;
    public int colno;
    public string lhs;
    public ImmediateAST rhs;
}
public partial class StoreMany
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "StoreMany";

    public int lineno;
    public int colno;
    public ImmediateAST[] lhs;
    public ImmediateAST rhs;
}
public partial class Bin
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "Bin";

    public int lineno;
    public int colno;
    public ImmediateAST left;
    public string op;
    public ImmediateAST right;
}
public partial class Load
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "Load";

    public int lineno;
    public int colno;
    public string n;
}
public partial class IfThenElse
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "IfThenElse";

    public int lineno;
    public int colno;
    public ImmediateAST cond;
    public ImmediateAST then;
    public ImmediateAST orelse;
}
public partial class While
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "While";

    public int lineno;
    public int colno;
    public ImmediateAST cond;
    public ImmediateAST then;
}
public partial class For
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "For";

    public int lineno;
    public int colno;
    public string target;
    public ImmediateAST iter;
    public ImmediateAST body;
}
public partial class OGet
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "OGet";

    public int lineno;
    public int colno;
    public ImmediateAST target;
    public ImmediateAST item;
}
public partial class OSet
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "OSet";

    public int lineno;
    public int colno;
    public ImmediateAST target;
    public ImmediateAST item;
    public ImmediateAST value;
}
public partial class Block
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "Block";

    public int lineno;
    public int colno;
    public ImmediateAST[] suite;
}
public partial class Call
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "Call";

    public int lineno;
    public int colno;
    public ImmediateAST f;
    public ImmediateAST[] args;
}
public partial class Function
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "Function";

    public int lineno;
    public int colno;
    public string name;
    public string[] args;
    public ImmediateAST body;
}
public partial class CStr
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "CStr";

    public int lineno;
    public int colno;
    public string str;
}
public partial class CInt
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "CInt";

    public int lineno;
    public int colno;
    public Int64 value;
}
public partial class CFloat
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "CFloat";

    public int lineno;
    public int colno;
    public float value;
}
public partial class CNone
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "CNone";

    public int lineno;
    public int colno;
}
public partial class CList
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "CList";

    public int lineno;
    public int colno;
    public ImmediateAST[] elts;
}
public partial class CTuple
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "CTuple";

    public int lineno;
    public int colno;
    public ImmediateAST[] elts;
}
public partial class CDict
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "CDict";

    public int lineno;
    public int colno;
    public (ImmediateAST, ImmediateAST)[] pairs;
}
public partial class Break
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "Break";

    public int lineno;
    public int colno;
}
public partial class Continue
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "Continue";

    public int lineno;
    public int colno;
}
public partial class Return
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "Return";

    public int lineno;
    public int colno;
    public ImmediateAST value;
}
public partial class And
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "And";

    public int lineno;
    public int colno;
    public ImmediateAST left;
    public ImmediateAST right;
}
public partial class Or
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "Or";

    public int lineno;
    public int colno;
    public ImmediateAST left;
    public ImmediateAST right;
}
public partial class Not
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "Not";

    public int lineno;
    public int colno;
    public ImmediateAST value;
}
public partial class Neg
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "Neg";

    public int lineno;
    public int colno;
    public ImmediateAST value;
}
public partial class Inv
{

    int ImmediateAST.Lineno => lineno;
    int ImmediateAST.Colno => colno;
    public string description => "Inv";

    public int lineno;
    public int colno;
    public ImmediateAST value;
}

public partial class Parser
{
    
    private ImmediateAST Read(THint<ImmediateAST> _) => ReadImmediateAST();

    public ImmediateAST ReadImmediateAST()
    {
        var code = (int) ReadTag();
        switch (code)
        {
            case 0:
            {
                return new Store
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    lhs = Read(THint<string>.val),
                    rhs = Read(THint<ImmediateAST>.val),
                };
            }
            case 1:
            {
                return new StoreMany
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    lhs = Read(THint<ImmediateAST[]>.val),
                    rhs = Read(THint<ImmediateAST>.val),
                };
            }
            case 2:
            {
                return new Bin
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    left = Read(THint<ImmediateAST>.val),
                    op = Read(THint<string>.val),
                    right = Read(THint<ImmediateAST>.val),
                };
            }
            case 3:
            {
                return new Load
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    n = Read(THint<string>.val),
                };
            }
            case 4:
            {
                return new IfThenElse
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    cond = Read(THint<ImmediateAST>.val),
                    then = Read(THint<ImmediateAST>.val),
                    orelse = Read(THint<ImmediateAST>.val),
                };
            }
            case 5:
            {
                return new While
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    cond = Read(THint<ImmediateAST>.val),
                    then = Read(THint<ImmediateAST>.val),
                };
            }
            case 6:
            {
                return new For
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    target = Read(THint<string>.val),
                    iter = Read(THint<ImmediateAST>.val),
                    body = Read(THint<ImmediateAST>.val),
                };
            }
            case 7:
            {
                return new OGet
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    target = Read(THint<ImmediateAST>.val),
                    item = Read(THint<ImmediateAST>.val),
                };
            }
            case 8:
            {
                return new OSet
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    target = Read(THint<ImmediateAST>.val),
                    item = Read(THint<ImmediateAST>.val),
                    value = Read(THint<ImmediateAST>.val),
                };
            }
            case 9:
            {
                return new Block
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    suite = Read(THint<ImmediateAST[]>.val),
                };
            }
            case 10:
            {
                return new Call
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    f = Read(THint<ImmediateAST>.val),
                    args = Read(THint<ImmediateAST[]>.val),
                };
            }
            case 11:
            {
                return new Function
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    name = Read(THint<string>.val),
                    args = Read(THint<string[]>.val),
                    body = Read(THint<ImmediateAST>.val),
                };
            }
            case 12:
            {
                return new CStr
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    str = Read(THint<string>.val),
                };
            }
            case 13:
            {
                return new CInt
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    value = Read(THint<Int64>.val),
                };
            }
            case 14:
            {
                return new CFloat
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    value = Read(THint<float>.val),
                };
            }
            case 15:
            {
                return new CNone
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                };
            }
            case 16:
            {
                return new CList
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    elts = Read(THint<ImmediateAST[]>.val),
                };
            }
            case 17:
            {
                return new CTuple
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    elts = Read(THint<ImmediateAST[]>.val),
                };
            }
            case 18:
            {
                return new CDict
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    pairs = Read(THint<(ImmediateAST, ImmediateAST)[]>.val),
                };
            }
            case 19:
            {
                return new Break
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                };
            }
            case 20:
            {
                return new Continue
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                };
            }
            case 21:
            {
                return new Return
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    value = Read(THint<ImmediateAST>.val),
                };
            }
            case 22:
            {
                return new And
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    left = Read(THint<ImmediateAST>.val),
                    right = Read(THint<ImmediateAST>.val),
                };
            }
            case 23:
            {
                return new Or
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    left = Read(THint<ImmediateAST>.val),
                    right = Read(THint<ImmediateAST>.val),
                };
            }
            case 24:
            {
                return new Not
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    value = Read(THint<ImmediateAST>.val),
                };
            }
            case 25:
            {
                return new Neg
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    value = Read(THint<ImmediateAST>.val),
                };
            }
            case 26:
            {
                return new Inv
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    value = Read(THint<ImmediateAST>.val),
                };
            }
            default:
                throw new InvalidDataException($"invalid code {code}");
        }
        
    }


    private Store Read(THint<Store> _) => ReadStore();

    public Store ReadStore() => new Store
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        lhs = Read(THint<string>.val),
        rhs = Read(THint<ImmediateAST>.val),
    };


    private StoreMany Read(THint<StoreMany> _) => ReadStoreMany();

    public StoreMany ReadStoreMany() => new StoreMany
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        lhs = Read(THint<ImmediateAST[]>.val),
        rhs = Read(THint<ImmediateAST>.val),
    };


    private Bin Read(THint<Bin> _) => ReadBin();

    public Bin ReadBin() => new Bin
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        left = Read(THint<ImmediateAST>.val),
        op = Read(THint<string>.val),
        right = Read(THint<ImmediateAST>.val),
    };


    private Load Read(THint<Load> _) => ReadLoad();

    public Load ReadLoad() => new Load
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        n = Read(THint<string>.val),
    };


    private IfThenElse Read(THint<IfThenElse> _) => ReadIfThenElse();

    public IfThenElse ReadIfThenElse() => new IfThenElse
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        cond = Read(THint<ImmediateAST>.val),
        then = Read(THint<ImmediateAST>.val),
        orelse = Read(THint<ImmediateAST>.val),
    };


    private While Read(THint<While> _) => ReadWhile();

    public While ReadWhile() => new While
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        cond = Read(THint<ImmediateAST>.val),
        then = Read(THint<ImmediateAST>.val),
    };


    private For Read(THint<For> _) => ReadFor();

    public For ReadFor() => new For
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        target = Read(THint<string>.val),
        iter = Read(THint<ImmediateAST>.val),
        body = Read(THint<ImmediateAST>.val),
    };


    private OGet Read(THint<OGet> _) => ReadOGet();

    public OGet ReadOGet() => new OGet
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        target = Read(THint<ImmediateAST>.val),
        item = Read(THint<ImmediateAST>.val),
    };


    private OSet Read(THint<OSet> _) => ReadOSet();

    public OSet ReadOSet() => new OSet
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        target = Read(THint<ImmediateAST>.val),
        item = Read(THint<ImmediateAST>.val),
        value = Read(THint<ImmediateAST>.val),
    };


    private Block Read(THint<Block> _) => ReadBlock();

    public Block ReadBlock() => new Block
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        suite = Read(THint<ImmediateAST[]>.val),
    };


    private Call Read(THint<Call> _) => ReadCall();

    public Call ReadCall() => new Call
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        f = Read(THint<ImmediateAST>.val),
        args = Read(THint<ImmediateAST[]>.val),
    };


    private Function Read(THint<Function> _) => ReadFunction();

    public Function ReadFunction() => new Function
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        name = Read(THint<string>.val),
        args = Read(THint<string[]>.val),
        body = Read(THint<ImmediateAST>.val),
    };


    private CStr Read(THint<CStr> _) => ReadCStr();

    public CStr ReadCStr() => new CStr
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        str = Read(THint<string>.val),
    };


    private CInt Read(THint<CInt> _) => ReadCInt();

    public CInt ReadCInt() => new CInt
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        value = Read(THint<Int64>.val),
    };


    private CFloat Read(THint<CFloat> _) => ReadCFloat();

    public CFloat ReadCFloat() => new CFloat
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        value = Read(THint<float>.val),
    };


    private CNone Read(THint<CNone> _) => ReadCNone();

    public CNone ReadCNone() => new CNone
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
    };


    private CList Read(THint<CList> _) => ReadCList();

    public CList ReadCList() => new CList
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        elts = Read(THint<ImmediateAST[]>.val),
    };


    private CTuple Read(THint<CTuple> _) => ReadCTuple();

    public CTuple ReadCTuple() => new CTuple
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        elts = Read(THint<ImmediateAST[]>.val),
    };


    private CDict Read(THint<CDict> _) => ReadCDict();

    public CDict ReadCDict() => new CDict
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        pairs = Read(THint<(ImmediateAST, ImmediateAST)[]>.val),
    };


    private Break Read(THint<Break> _) => ReadBreak();

    public Break ReadBreak() => new Break
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
    };


    private Continue Read(THint<Continue> _) => ReadContinue();

    public Continue ReadContinue() => new Continue
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
    };


    private Return Read(THint<Return> _) => ReadReturn();

    public Return ReadReturn() => new Return
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        value = Read(THint<ImmediateAST>.val),
    };


    private And Read(THint<And> _) => ReadAnd();

    public And ReadAnd() => new And
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        left = Read(THint<ImmediateAST>.val),
        right = Read(THint<ImmediateAST>.val),
    };


    private Or Read(THint<Or> _) => ReadOr();

    public Or ReadOr() => new Or
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        left = Read(THint<ImmediateAST>.val),
        right = Read(THint<ImmediateAST>.val),
    };


    private Not Read(THint<Not> _) => ReadNot();

    public Not ReadNot() => new Not
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        value = Read(THint<ImmediateAST>.val),
    };


    private Neg Read(THint<Neg> _) => ReadNeg();

    public Neg ReadNeg() => new Neg
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        value = Read(THint<ImmediateAST>.val),
    };


    private Inv Read(THint<Inv> _) => ReadInv();

    public Inv ReadInv() => new Inv
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        value = Read(THint<ImmediateAST>.val),
    };


    private static readonly object _loaderSync = new object();

    public ImmediateAST[] Read(THint<ImmediateAST[]> _)
    {
        var arr = new ImmediateAST[ReadInt()];
        for(var i = 0; i < arr.Length; i++)
        {
            arr[i] = Read(THint<ImmediateAST>.val);
        }
        return arr;
    }
    public string[] Read(THint<string[]> _)
    {
        var arr = new string[ReadInt()];
        for(var i = 0; i < arr.Length; i++)
        {
            arr[i] = Read(THint<string>.val);
        }
        return arr;
    }
    public (ImmediateAST, ImmediateAST)[] Read(THint<(ImmediateAST, ImmediateAST)[]> _)
    {
        var arr = new (ImmediateAST, ImmediateAST)[ReadInt()];
        for(var i = 0; i < arr.Length; i++)
        {
            arr[i] = Read(THint<(ImmediateAST, ImmediateAST)>.val);
        }
        return arr;
    }

} // loader class
} // aworld