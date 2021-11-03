StoreMany(
    int lineno, int colno,
    ImmediateAST[] lhs, ImmediateAST rhs)

Bin(
    int lineno,
    int colno,
    ImmediateAST left,
    string op,
    ImmediateAST right)

IBin(
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

Raise(
    int lineno,
    int colno,
    ImmediateAST expr
)


Loop(
    int lineno,
    int colno,
    ImmediateAST body
)

Meta(
    int lineno,
    int colno,
    int filename_idx,
    ImmediateAST inner
)

SetMeta(
    int lineno,
    int colno,
    int idx,
    string filename
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

CVal(
    int lineno,
    int colno,
    DObj obj
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

CStrDict(
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

Decl(
    int lineno,
    int colno,
    string[] names
)


ExprStmt(
    int lineno,
    int colno,
    ImmediateAST expr
)
