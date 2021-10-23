from __future__ import annotations
from dataclasses import dataclass
from dina.serialize import serialize_, Int64
import struct

@dataclass(frozen=True)
class Store:
    lineno: int
    colno: int
    lhs: str
    rhs: ImmediateAST
    TAG = 0
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.lhs, buf)
        serialize_(self.rhs, buf)
@dataclass(frozen=True)
class StoreMany:
    lineno: int
    colno: int
    lhs: list[ImmediateAST]
    rhs: ImmediateAST
    TAG = 1
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.lhs, buf)
        serialize_(self.rhs, buf)
@dataclass(frozen=True)
class Bin:
    lineno: int
    colno: int
    left: ImmediateAST
    op: str
    right: ImmediateAST
    TAG = 2
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.left, buf)
        serialize_(self.op, buf)
        serialize_(self.right, buf)
@dataclass(frozen=True)
class Load:
    lineno: int
    colno: int
    n: str
    TAG = 3
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.n, buf)
@dataclass(frozen=True)
class IfThenElse:
    lineno: int
    colno: int
    cond: ImmediateAST
    then: ImmediateAST
    orelse: ImmediateAST
    TAG = 4
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.cond, buf)
        serialize_(self.then, buf)
        serialize_(self.orelse, buf)
@dataclass(frozen=True)
class NestedIf:
    lineno: int
    colno: int
    elifs: list[tuple[ImmediateAST, ImmediateAST]]
    orelse: ImmediateAST
    TAG = 5
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.elifs, buf)
        serialize_(self.orelse, buf)
@dataclass(frozen=True)
class While:
    lineno: int
    colno: int
    cond: ImmediateAST
    then: ImmediateAST
    TAG = 6
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.cond, buf)
        serialize_(self.then, buf)
@dataclass(frozen=True)
class Loop:
    lineno: int
    colno: int
    body: ImmediateAST
    TAG = 7
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.body, buf)
@dataclass(frozen=True)
class For:
    lineno: int
    colno: int
    target: str
    iter: ImmediateAST
    body: ImmediateAST
    TAG = 8
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.target, buf)
        serialize_(self.iter, buf)
        serialize_(self.body, buf)
@dataclass(frozen=True)
class OGet:
    lineno: int
    colno: int
    target: ImmediateAST
    item: ImmediateAST
    TAG = 9
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.target, buf)
        serialize_(self.item, buf)
@dataclass(frozen=True)
class OSet:
    lineno: int
    colno: int
    target: ImmediateAST
    item: ImmediateAST
    value: ImmediateAST
    TAG = 10
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.target, buf)
        serialize_(self.item, buf)
        serialize_(self.value, buf)
@dataclass(frozen=True)
class Block:
    lineno: int
    colno: int
    suite: list[ImmediateAST]
    TAG = 11
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.suite, buf)
@dataclass(frozen=True)
class Call:
    lineno: int
    colno: int
    f: ImmediateAST
    args: list[ImmediateAST]
    TAG = 12
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.f, buf)
        serialize_(self.args, buf)
@dataclass(frozen=True)
class Function:
    lineno: int
    colno: int
    name: str
    args: list[str]
    body: ImmediateAST
    TAG = 13
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.name, buf)
        serialize_(self.args, buf)
        serialize_(self.body, buf)
@dataclass(frozen=True)
class CStr:
    lineno: int
    colno: int
    str: str
    TAG = 14
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.str, buf)
@dataclass(frozen=True)
class CVal:
    lineno: int
    colno: int
    obj: DObj
    TAG = 15
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.obj, buf)
@dataclass(frozen=True)
class CInt:
    lineno: int
    colno: int
    value: Int64
    TAG = 16
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.value, buf)
@dataclass(frozen=True)
class CFloat:
    lineno: int
    colno: int
    value: float
    TAG = 17
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.value, buf)
@dataclass(frozen=True)
class CNone:
    lineno: int
    colno: int
    TAG = 18
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
@dataclass(frozen=True)
class CList:
    lineno: int
    colno: int
    elts: list[ImmediateAST]
    TAG = 19
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.elts, buf)
@dataclass(frozen=True)
class CTuple:
    lineno: int
    colno: int
    elts: list[ImmediateAST]
    TAG = 20
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.elts, buf)
@dataclass(frozen=True)
class CDict:
    lineno: int
    colno: int
    pairs: list[tuple[ImmediateAST, ImmediateAST]]
    TAG = 21
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.pairs, buf)
@dataclass(frozen=True)
class Break:
    lineno: int
    colno: int
    TAG = 22
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
@dataclass(frozen=True)
class Continue:
    lineno: int
    colno: int
    TAG = 23
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
@dataclass(frozen=True)
class Return:
    lineno: int
    colno: int
    value: ImmediateAST
    TAG = 24
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.value, buf)
@dataclass(frozen=True)
class And:
    lineno: int
    colno: int
    left: ImmediateAST
    right: ImmediateAST
    TAG = 25
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.left, buf)
        serialize_(self.right, buf)
@dataclass(frozen=True)
class Or:
    lineno: int
    colno: int
    left: ImmediateAST
    right: ImmediateAST
    TAG = 26
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.left, buf)
        serialize_(self.right, buf)
@dataclass(frozen=True)
class Not:
    lineno: int
    colno: int
    value: ImmediateAST
    TAG = 27
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.value, buf)
@dataclass(frozen=True)
class Neg:
    lineno: int
    colno: int
    value: ImmediateAST
    TAG = 28
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.value, buf)
@dataclass(frozen=True)
class Inv:
    lineno: int
    colno: int
    value: ImmediateAST
    TAG = 29
    
    def serialize_(self, buf: bytearray):
        buf.append(self.TAG)
        serialize_(self.lineno, buf)
        serialize_(self.colno, buf)
        serialize_(self.value, buf)

ImmediateAST = (
    object
    | Store
    | StoreMany
    | Bin
    | Load
    | IfThenElse
    | NestedIf
    | While
    | Loop
    | For
    | OGet
    | OSet
    | Block
    | Call
    | Function
    | CStr
    | CVal
    | CInt
    | CFloat
    | CNone
    | CList
    | CTuple
    | CDict
    | Break
    | Continue
    | Return
    | And
    | Or
    | Not
    | Neg
    | Inv
)