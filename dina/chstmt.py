from __future__ import annotations
from enum import Enum, auto as _auto
import typing
from dataclasses import dataclass


from dina.chexpr import *


@dataclass
class SFunc:
    name:str
    args:list[str]
    body:list[Chstmt]
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class SDecl:
    vars:list[str]
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class SAssign:
    targets:list[Chexpr]
    value:Chexpr
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class SExpr:
    expr:Chexpr
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class SFor:
    target:str
    iter:Chexpr
    body:list[Chstmt]
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class SLoop:
    block:list[Chstmt]
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class SIf:
    cond:Chexpr
    then:list[Chstmt]
    orelse:list[Chstmt]|None
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class SBreak:
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class SContinue:
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class SReturn:
    val:Chexpr|None
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


Chstmt = SFunc | SDecl | SAssign | SExpr | SFor | SLoop | SIf | SBreak | SContinue | SReturn