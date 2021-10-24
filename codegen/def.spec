Store(
    int lineno, int colno,
    string lhs, ImmediateAST rhs)


StoreMany(
    int lineno, int colno,
    ImmediateAST[] lhs, ImmediateAST rhs)

Bin(
    int lineno,
    int colno,
    ImmediateAST left,
    string op,
    ImmediateAST right)

Load(
    int lineno,
    int colno,
    string n)

IfThenElse(
    int lineno,
    int colno,
    ImmediateAST cond,
    ImmediateAST then,
    ImmediateAST orelse)

NestedIf(
    int lineno,
    int colno,
    (ImmediateAST, ImmediateAST)[] elifs,
    ImmediateAST orelse)


While(
    int lineno,
    int colno,
    ImmediateAST cond,
    ImmediateAST then
)


Loop(
    int lineno,
    int colno,
    ImmediateAST body
)

For(
    int lineno,
    int colno,
    string target,
    ImmediateAST iter,
    ImmediateAST body
)


OGet(
    int lineno,
    int colno,
    ImmediateAST target,
    ImmediateAST item
)

OSet(
    int lineno,
    int colno,
    ImmediateAST target,
    ImmediateAST item,
    ImmediateAST value
)


Block(
    int lineno,
    int colno,
    ImmediateAST[] suite
)

Call(
    int lineno,
    int colno,
    ImmediateAST f,
    ImmediateAST[] args
)

Function(
    int lineno,
    int colno,
    string name,
    string[] args,
    ImmediateAST body
)

CStr(
    int lineno,
    int colno,
    string str
)

CVal(
    int lineno,
    int colno,
    DObj obj
)

CInt(
    int lineno,
    int colno,
    Int64 value
)

CFloat(
    int lineno,
    int colno,
    float value
)

CNone(
    int lineno,
    int colno
)

CList(
    int lineno,
    int colno,
    ImmediateAST[] elts
)

CTuple(
    int lineno,
    int colno,
    ImmediateAST[] elts
)

CDict(
    int lineno,
    int colno,
    (ImmediateAST, ImmediateAST)[] pairs
)

Break(
    int lineno,
    int colno
)

Continue(
    int lineno,
    int colno
)

Return(
    int lineno,
    int colno,
    ImmediateAST value
)

And(
    int lineno,
    int colno,
    ImmediateAST left,
    ImmediateAST right
)

Or(
    int lineno,
    int colno,
    ImmediateAST left,
    ImmediateAST right
)

Not(
    int lineno,
    int colno,
    ImmediateAST value
)

Neg(
    int lineno,
    int colno,
    ImmediateAST value
)


Inv(
    int lineno,
    int colno,
    ImmediateAST value
)

Workflow(
    int lineno,
    int colno,
    ImmediateAST builder,
    (int, int, string, ImmediateAST[])[] options
)