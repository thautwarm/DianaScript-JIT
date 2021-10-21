from contextlib import contextmanager
from typing import Callable
from dina.chexpr import *
from dina.chstmt import *
from dina.code_cons import *
from dina.logger import logger


import logging

RETURN = 0
GO_AHEAD = 1
LOOP_BREAK = 2
LOOP_CONTINUE = 3

GLOBAL_FLAG = 0b11

class CG:
    def __init__(self, filename: str) -> None:
        self.filename = filename
        self.linenos = []
        self.lineno = 0
        self.colno = 0

    def cg_for_stmts(self, stmts):
        l = self.lineno
        c = self.colno
        res = []
        for stmt in stmts:
            res.append(self.cg_for_stmt(stmt))
        return Block(l, c, res)
    
    def cg_for_stmt(self, stmt: Chstmt):
        if stmt.loc:
            new_lineno, new_colno = \
                (self.lineno, self.colno) = stmt.loc
            
        match stmt:
            case SFunc(name, args, body):
                narg = len(args)
                sub_cg = CG(self.filename)
                return Function(
                    self.lineno, self.colno, name, args, 
                    self.cg_for_stmts(body))
                    

            case SAssign(targets, value):
                lhs = [self.cg_for_expr(target) for target in targets]
                
                return StoreMany(
                    self.lineno, self.colno, lhs, self.cg_for_expr(value))
               
            case SExpr(expr):
                return self.cg_for_expr(expr)

            case SLoop(body):
                return While(self.lineno, self.colno,
                CInt(self.lineno, self.colno, 1), self.cg_for_stmts(body))

            case SFor(target, iter, body):
                return For(self.lineno, self.colno,
                target, self.cg_for_expr(iter), self.cg_for_stmts(body))

            case SIf(cond, then, orelse):
                orelse = orelse or []
                return IfThenElse(self.lineno, self.colno,
                self.cg_for_expr(cond), self.cg_for_stmts(then), self.cg_for_stmts(orelse))
            
          
            case SBreak():
                return Break(self.lineno, self.colno)

            case SContinue():
                return Continue(self.lineno, self.colno)

            case SReturn(val):
                if not val:
                    return Return(self.lineno, self.colno, CNone(self.lineno, self.colno))
                return Return(self.lineno, self.colno, self.cg_for_expr(val))

            case a:
                raise NotImplementedError(a)


    def cg_for_expr(self, expr: Chexpr) -> ImmediateAST:
        if expr.loc:
            self.lineno, self.colno = new_lineno, new_colno = expr.loc
            
        match expr:
            case EVal(val):
                if isinstance(val, str):
                    return CStr(self.lineno, self.colno, val)
                if isinstance(val, int):
                    return CInt(self.lineno, self.colno, val)
                if isinstance(val, float):
                    return CFloat(self.lineno, self.colno, val)
                if val is None:
                    return CNone(self.lineno, self.colno)
                raise
            case EVar(var):
                return Load(self.lineno, self.colno, var)
            case EApp(f, args):
                return Call(
                    self.lineno, self.colno,
                    self.cg_for_expr(f),
                    list(map(self.cg_for_expr, args)))
                
            case EIt(value, item):
                return OGet(
                    self.lineno, self.colno,
                    self.cg_for_expr(value),
                    self.cg_for_expr(item))
            case EAttr(value, attr):
                return OGet(
                    self.lineno, self.colno,
                    self.cg_for_expr(value),
                    CStr(self.lineno, self.colno, attr))
            case EPar([elt],  False):
                return self.cg_for_expr(elt)
            case EPar(elts,  _):
                return CTuple(
                    self.lineno, self.colno,
                    list(map(self.cg_for_expr, elts)))
            
            case EDict(kvs):
                return CDict(
                    self.lineno, self.colno,
                    [(self.cg_for_expr(k), self.cg_for_expr(v)) for k, v in kvs] )
            
            case EList(elts):
                return CList(
                    self.lineno, self.colno,
                    list(map(self.cg_for_expr, elts)))
            
            case ENot(expr):
                return Not(
                    self.lineno, self.colno,
                    self.cg_for_expr(expr))
                

            case ENeg(expr):
                return Neg(
                    self.lineno, self.colno,
                    self.cg_for_expr(expr))
                
            case EInv(expr):
                return Inv(
                    self.lineno, self.colno,
                    self.cg_for_expr(expr))
                

            case EAnd(a, b):
                return And(
                    self.lineno, self.colno,
                    self.cg_for_expr(a),
                    self.cg_for_expr(b),
                    )
                

            case EOr(a, b):
                return Or(
                    self.lineno, self.colno,
                    self.cg_for_expr(a),
                    self.cg_for_expr(b),
                    )
            

            case EOp(left=left, op=op, right=right):
                
                return Bin(
                    self.lineno, self.colno,
                    self.cg_for_expr(left),
                    op,
                    self.cg_for_expr(right))
                      
            case _:
                raise

_op_map = {
    "+": "add",
    "-": "sub",
    "*": "mul",
    r"/": "truediv",
    r"//": "floordiv",
    "%": "mod",
    "**": "pow",
    "<<": "lshift",
    ">>": "rshift",
    "|": "bitor",
    "&": "bitand",
    "^": "bitxor",
    ">": "gt",
    "<": "lt",
    ">=": "ge",
    "<=": "le",
    "==": "eq",
    "!=": "ne",
    "in": "in",
    "notin": "notin"
}


def codegen(filename: str, suite: list[Chstmt]):
    barr = bytearray()
    cg = CG(filename)
    block = cg.cg_for_stmts(suite)
    serialize_(block, barr)
    return barr
