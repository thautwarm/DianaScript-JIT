using System;
using System.IO;
using System.Collections;
using System.Collections.Generic;


namespace Diana
{

[Serializable]
public partial class StoreMany : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        lhs.__resolve_local(ctx);
        rhs.__resolve_local(ctx);
    }

    public string description => "StoreMany";

    public int lineno;
    public int colno;
    public (ImmediateAST, string)[] lhs;
    public ImmediateAST rhs;
    public static StoreMany make(
        (ImmediateAST, string)[] lhs,
        ImmediateAST rhs,
        int lineno,
        int colno
    ) => new  StoreMany {
        lineno = lineno,
        colno = colno,
        lhs = lhs,
        rhs = rhs,
    };
}
[Serializable]
public partial class Bin : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        left.__resolve_local(ctx);
        op.__resolve_local(ctx);
        right.__resolve_local(ctx);
    }

    public string description => "Bin";

    public int lineno;
    public int colno;
    public ImmediateAST left;
    public string op;
    public ImmediateAST right;
    public static Bin make(
        ImmediateAST left,
        string op,
        ImmediateAST right,
        int lineno,
        int colno
    ) => new  Bin {
        lineno = lineno,
        colno = colno,
        left = left,
        op = op,
        right = right,
    };
}
[Serializable]
public partial class Load : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        n.__resolve_local(ctx);
    }

    public string description => "Load";

    public int lineno;
    public int colno;
    public string n;
    public static Load make(
        string n,
        int lineno,
        int colno
    ) => new  Load {
        lineno = lineno,
        colno = colno,
        n = n,
    };
}
[Serializable]
public partial class IfThenElse : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        cond.__resolve_local(ctx);
        then.__resolve_local(ctx);
        orelse.__resolve_local(ctx);
    }

    public string description => "IfThenElse";

    public int lineno;
    public int colno;
    public ImmediateAST cond;
    public ImmediateAST then;
    public ImmediateAST orelse;
    public static IfThenElse make(
        ImmediateAST cond,
        ImmediateAST then,
        ImmediateAST orelse,
        int lineno,
        int colno
    ) => new  IfThenElse {
        lineno = lineno,
        colno = colno,
        cond = cond,
        then = then,
        orelse = orelse,
    };
}
[Serializable]
public partial class NestedIf : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        elifs.__resolve_local(ctx);
        orelse.__resolve_local(ctx);
    }

    public string description => "NestedIf";

    public int lineno;
    public int colno;
    public (ImmediateAST, ImmediateAST)[] elifs;
    public ImmediateAST orelse;
    public static NestedIf make(
        (ImmediateAST, ImmediateAST)[] elifs,
        ImmediateAST orelse,
        int lineno,
        int colno
    ) => new  NestedIf {
        lineno = lineno,
        colno = colno,
        elifs = elifs,
        orelse = orelse,
    };
}
[Serializable]
public partial class While : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        cond.__resolve_local(ctx);
        then.__resolve_local(ctx);
    }

    public string description => "While";

    public int lineno;
    public int colno;
    public ImmediateAST cond;
    public ImmediateAST then;
    public static While make(
        ImmediateAST cond,
        ImmediateAST then,
        int lineno,
        int colno
    ) => new  While {
        lineno = lineno,
        colno = colno,
        cond = cond,
        then = then,
    };
}
[Serializable]
public partial class Raise : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        expr.__resolve_local(ctx);
    }

    public string description => "Raise";

    public int lineno;
    public int colno;
    public ImmediateAST expr;
    public static Raise make(
        ImmediateAST expr,
        int lineno,
        int colno
    ) => new  Raise {
        lineno = lineno,
        colno = colno,
        expr = expr,
    };
}
[Serializable]
public partial class Loop : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        body.__resolve_local(ctx);
    }

    public string description => "Loop";

    public int lineno;
    public int colno;
    public ImmediateAST body;
    public static Loop make(
        ImmediateAST body,
        int lineno,
        int colno
    ) => new  Loop {
        lineno = lineno,
        colno = colno,
        body = body,
    };
}
[Serializable]
public partial class Meta : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        filename_idx.__resolve_local(ctx);
        inner.__resolve_local(ctx);
    }

    public string description => "Meta";

    public int lineno;
    public int colno;
    public int filename_idx;
    public ImmediateAST inner;
    public static Meta make(
        int filename_idx,
        ImmediateAST inner,
        int lineno,
        int colno
    ) => new  Meta {
        lineno = lineno,
        colno = colno,
        filename_idx = filename_idx,
        inner = inner,
    };
}
[Serializable]
public partial class SetMeta : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        idx.__resolve_local(ctx);
        filename.__resolve_local(ctx);
    }

    public string description => "SetMeta";

    public int lineno;
    public int colno;
    public int idx;
    public string filename;
    public static SetMeta make(
        int idx,
        string filename,
        int lineno,
        int colno
    ) => new  SetMeta {
        lineno = lineno,
        colno = colno,
        idx = idx,
        filename = filename,
    };
}
[Serializable]
public partial class For : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        target.__resolve_local(ctx);
        iter.__resolve_local(ctx);
        body.__resolve_local(ctx);
    }

    public string description => "For";

    public int lineno;
    public int colno;
    public string target;
    public ImmediateAST iter;
    public ImmediateAST body;
    public static For make(
        string target,
        ImmediateAST iter,
        ImmediateAST body,
        int lineno,
        int colno
    ) => new  For {
        lineno = lineno,
        colno = colno,
        target = target,
        iter = iter,
        body = body,
    };
}
[Serializable]
public partial class OGet : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        target.__resolve_local(ctx);
        item.__resolve_local(ctx);
    }

    public string description => "OGet";

    public int lineno;
    public int colno;
    public ImmediateAST target;
    public ImmediateAST item;
    public static OGet make(
        ImmediateAST target,
        ImmediateAST item,
        int lineno,
        int colno
    ) => new  OGet {
        lineno = lineno,
        colno = colno,
        target = target,
        item = item,
    };
}
[Serializable]
public partial class Block : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        suite.__resolve_local(ctx);
    }

    public string description => "Block";

    public int lineno;
    public int colno;
    public ImmediateAST[] suite;
    public static Block make(
        ImmediateAST[] suite,
        int lineno,
        int colno
    ) => new  Block {
        lineno = lineno,
        colno = colno,
        suite = suite,
    };
}
[Serializable]
public partial class Call : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        f.__resolve_local(ctx);
        args.__resolve_local(ctx);
    }

    public string description => "Call";

    public int lineno;
    public int colno;
    public ImmediateAST f;
    public ImmediateAST[] args;
    public static Call make(
        ImmediateAST f,
        ImmediateAST[] args,
        int lineno,
        int colno
    ) => new  Call {
        lineno = lineno,
        colno = colno,
        f = f,
        args = args,
    };
}
[Serializable]
public partial class Function : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        name.__resolve_local(ctx);
        args.__resolve_local(ctx);
        body.__resolve_local(ctx);
    }

    public string description => "Function";

    public int lineno;
    public int colno;
    public string name;
    public string[] args;
    public ImmediateAST body;
    public static Function make(
        string name,
        string[] args,
        ImmediateAST body,
        int lineno,
        int colno
    ) => new  Function {
        lineno = lineno,
        colno = colno,
        name = name,
        args = args,
        body = body,
    };
}
[Serializable]
public partial class CVal : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        obj.__resolve_local(ctx);
    }

    public string description => "CVal";

    public int lineno;
    public int colno;
    public DObj obj;
    public static CVal make(
        DObj obj,
        int lineno,
        int colno
    ) => new  CVal {
        lineno = lineno,
        colno = colno,
        obj = obj,
    };
}
[Serializable]
public partial class CList : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        elts.__resolve_local(ctx);
    }

    public string description => "CList";

    public int lineno;
    public int colno;
    public ImmediateAST[] elts;
    public static CList make(
        ImmediateAST[] elts,
        int lineno,
        int colno
    ) => new  CList {
        lineno = lineno,
        colno = colno,
        elts = elts,
    };
}
[Serializable]
public partial class CTuple : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        elts.__resolve_local(ctx);
    }

    public string description => "CTuple";

    public int lineno;
    public int colno;
    public ImmediateAST[] elts;
    public static CTuple make(
        ImmediateAST[] elts,
        int lineno,
        int colno
    ) => new  CTuple {
        lineno = lineno,
        colno = colno,
        elts = elts,
    };
}
[Serializable]
public partial class CDict : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        pairs.__resolve_local(ctx);
    }

    public string description => "CDict";

    public int lineno;
    public int colno;
    public (ImmediateAST, ImmediateAST)[] pairs;
    public static CDict make(
        (ImmediateAST, ImmediateAST)[] pairs,
        int lineno,
        int colno
    ) => new  CDict {
        lineno = lineno,
        colno = colno,
        pairs = pairs,
    };
}
[Serializable]
public partial class CSet : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        elts.__resolve_local(ctx);
    }

    public string description => "CSet";

    public int lineno;
    public int colno;
    public ImmediateAST[] elts;
    public static CSet make(
        ImmediateAST[] elts,
        int lineno,
        int colno
    ) => new  CSet {
        lineno = lineno,
        colno = colno,
        elts = elts,
    };
}
[Serializable]
public partial class Break : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
    }

    public string description => "Break";

    public int lineno;
    public int colno;
    public static Break make(
        int lineno,
        int colno
    ) => new  Break {
        lineno = lineno,
        colno = colno,
    };
}
[Serializable]
public partial class Continue : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
    }

    public string description => "Continue";

    public int lineno;
    public int colno;
    public static Continue make(
        int lineno,
        int colno
    ) => new  Continue {
        lineno = lineno,
        colno = colno,
    };
}
[Serializable]
public partial class Return : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        value.__resolve_local(ctx);
    }

    public string description => "Return";

    public int lineno;
    public int colno;
    public ImmediateAST value;
    public static Return make(
        ImmediateAST value,
        int lineno,
        int colno
    ) => new  Return {
        lineno = lineno,
        colno = colno,
        value = value,
    };
}
[Serializable]
public partial class And : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        left.__resolve_local(ctx);
        right.__resolve_local(ctx);
    }

    public string description => "And";

    public int lineno;
    public int colno;
    public ImmediateAST left;
    public ImmediateAST right;
    public static And make(
        ImmediateAST left,
        ImmediateAST right,
        int lineno,
        int colno
    ) => new  And {
        lineno = lineno,
        colno = colno,
        left = left,
        right = right,
    };
}
[Serializable]
public partial class Or : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        left.__resolve_local(ctx);
        right.__resolve_local(ctx);
    }

    public string description => "Or";

    public int lineno;
    public int colno;
    public ImmediateAST left;
    public ImmediateAST right;
    public static Or make(
        ImmediateAST left,
        ImmediateAST right,
        int lineno,
        int colno
    ) => new  Or {
        lineno = lineno,
        colno = colno,
        left = left,
        right = right,
    };
}
[Serializable]
public partial class Not : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        value.__resolve_local(ctx);
    }

    public string description => "Not";

    public int lineno;
    public int colno;
    public ImmediateAST value;
    public static Not make(
        ImmediateAST value,
        int lineno,
        int colno
    ) => new  Not {
        lineno = lineno,
        colno = colno,
        value = value,
    };
}
[Serializable]
public partial class Neg : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        value.__resolve_local(ctx);
    }

    public string description => "Neg";

    public int lineno;
    public int colno;
    public ImmediateAST value;
    public static Neg make(
        ImmediateAST value,
        int lineno,
        int colno
    ) => new  Neg {
        lineno = lineno,
        colno = colno,
        value = value,
    };
}
[Serializable]
public partial class Inv : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        value.__resolve_local(ctx);
    }

    public string description => "Inv";

    public int lineno;
    public int colno;
    public ImmediateAST value;
    public static Inv make(
        ImmediateAST value,
        int lineno,
        int colno
    ) => new  Inv {
        lineno = lineno,
        colno = colno,
        value = value,
    };
}
[Serializable]
public partial class Decl : ImmediateAST
{

    int ImmediateAST.Lineno { set => lineno = value; get => lineno; }
    int ImmediateAST.Colno { set => colno = value; get => colno; }

    public void __default_resolve_local(MetaContext ctx)
    {
        names.__resolve_local(ctx);
    }

    public string description => "Decl";

    public int lineno;
    public int colno;
    public string[] names;
    public static Decl make(
        string[] names,
        int lineno,
        int colno
    ) => new  Decl {
        lineno = lineno,
        colno = colno,
        names = names,
    };
}

public partial class ByteASTLoader
{
    
    private ImmediateAST Read(THint<ImmediateAST> _) => ReadImmediateAST();

    public ImmediateAST ReadImmediateAST()
    {
        var code = (int) ReadTag();
        switch (code)
        {
            case 0:
            {
                return new StoreMany
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    lhs = Read(THint<(ImmediateAST, string)[]>.val),
                    rhs = Read(THint<ImmediateAST>.val),
                };
            }
            case 1:
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
            case 2:
            {
                return new Load
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    n = Read(THint<string>.val),
                };
            }
            case 3:
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
            case 4:
            {
                return new NestedIf
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    elifs = Read(THint<(ImmediateAST, ImmediateAST)[]>.val),
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
                return new Raise
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    expr = Read(THint<ImmediateAST>.val),
                };
            }
            case 7:
            {
                return new Loop
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    body = Read(THint<ImmediateAST>.val),
                };
            }
            case 8:
            {
                return new Meta
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    filename_idx = Read(THint<int>.val),
                    inner = Read(THint<ImmediateAST>.val),
                };
            }
            case 9:
            {
                return new SetMeta
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    idx = Read(THint<int>.val),
                    filename = Read(THint<string>.val),
                };
            }
            case 10:
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
            case 11:
            {
                return new OGet
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    target = Read(THint<ImmediateAST>.val),
                    item = Read(THint<ImmediateAST>.val),
                };
            }
            case 12:
            {
                return new Block
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    suite = Read(THint<ImmediateAST[]>.val),
                };
            }
            case 13:
            {
                return new Call
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    f = Read(THint<ImmediateAST>.val),
                    args = Read(THint<ImmediateAST[]>.val),
                };
            }
            case 14:
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
            case 15:
            {
                return new CVal
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    obj = Read(THint<DObj>.val),
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
                return new CSet
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    elts = Read(THint<ImmediateAST[]>.val),
                };
            }
            case 20:
            {
                return new Break
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                };
            }
            case 21:
            {
                return new Continue
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                };
            }
            case 22:
            {
                return new Return
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    value = Read(THint<ImmediateAST>.val),
                };
            }
            case 23:
            {
                return new And
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    left = Read(THint<ImmediateAST>.val),
                    right = Read(THint<ImmediateAST>.val),
                };
            }
            case 24:
            {
                return new Or
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    left = Read(THint<ImmediateAST>.val),
                    right = Read(THint<ImmediateAST>.val),
                };
            }
            case 25:
            {
                return new Not
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    value = Read(THint<ImmediateAST>.val),
                };
            }
            case 26:
            {
                return new Neg
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    value = Read(THint<ImmediateAST>.val),
                };
            }
            case 27:
            {
                return new Inv
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    value = Read(THint<ImmediateAST>.val),
                };
            }
            case 28:
            {
                return new Decl
                {
                    lineno = Read(THint<int>.val),
                    colno = Read(THint<int>.val),
                    names = Read(THint<string[]>.val),
                };
            }
            default:
                throw new InvalidDataException($"invalid code {code}");
        }
        
    }


    private StoreMany Read(THint<StoreMany> _) => ReadStoreMany();

    public StoreMany ReadStoreMany() => new StoreMany
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        lhs = Read(THint<(ImmediateAST, string)[]>.val),
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


    private NestedIf Read(THint<NestedIf> _) => ReadNestedIf();

    public NestedIf ReadNestedIf() => new NestedIf
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        elifs = Read(THint<(ImmediateAST, ImmediateAST)[]>.val),
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


    private Raise Read(THint<Raise> _) => ReadRaise();

    public Raise ReadRaise() => new Raise
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        expr = Read(THint<ImmediateAST>.val),
    };


    private Loop Read(THint<Loop> _) => ReadLoop();

    public Loop ReadLoop() => new Loop
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        body = Read(THint<ImmediateAST>.val),
    };


    private Meta Read(THint<Meta> _) => ReadMeta();

    public Meta ReadMeta() => new Meta
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        filename_idx = Read(THint<int>.val),
        inner = Read(THint<ImmediateAST>.val),
    };


    private SetMeta Read(THint<SetMeta> _) => ReadSetMeta();

    public SetMeta ReadSetMeta() => new SetMeta
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        idx = Read(THint<int>.val),
        filename = Read(THint<string>.val),
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


    private CVal Read(THint<CVal> _) => ReadCVal();

    public CVal ReadCVal() => new CVal
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        obj = Read(THint<DObj>.val),
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


    private CSet Read(THint<CSet> _) => ReadCSet();

    public CSet ReadCSet() => new CSet
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        elts = Read(THint<ImmediateAST[]>.val),
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


    private Decl Read(THint<Decl> _) => ReadDecl();

    public Decl ReadDecl() => new Decl
    {
        lineno = Read(THint<int>.val),
        colno = Read(THint<int>.val),
        names = Read(THint<string[]>.val),
    };


    private static readonly object _loaderSync = new object();

    public (ImmediateAST, string)[] Read(THint<(ImmediateAST, string)[]> _)
    {
        var arr = new (ImmediateAST, string)[ReadInt()];
        for(var i = 0; i < arr.Length; i++)
        {
            arr[i] = Read(THint<(ImmediateAST, string)>.val);
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
    public string[] Read(THint<string[]> _)
    {
        var arr = new string[ReadInt()];
        for(var i = 0; i < arr.Length; i++)
        {
            arr[i] = Read(THint<string>.val);
        }
        return arr;
    }
    public ImmediateAST[] Read(THint<ImmediateAST[]> _)
    {
        var arr = new ImmediateAST[ReadInt()];
        for(var i = 0; i < arr.Length; i++)
        {
            arr[i] = Read(THint<ImmediateAST>.val);
        }
        return arr;
    }

} // loader class
} // aworld