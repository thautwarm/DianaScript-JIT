from __future__ import annotations
from enum import Enum, auto as _auto
import typing
from dataclasses import dataclass


@dataclass
class EVal:
    val:object
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class EVar:
    var:str
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class EApp:
    f:Chexpr
    args:list[Chexpr]
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class EIt:
    value:Chexpr
    item:Chexpr
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class EAttr:
    value:Chexpr
    attr:str
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class EPar:
    elts:list[Chexpr]
    trailer:bool
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class EDict:
    pairs:list[tuple[Chexpr,
    Chexpr]]
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class EList:
    elts:list[Chexpr]
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class ENot:
    expr:Chexpr
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class ENeg:
    expr:Chexpr
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class EInv:
    expr:Chexpr
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class EAnd:
    left:Chexpr
    right:Chexpr
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class EOr:
    left:Chexpr
    right:Chexpr
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


@dataclass
class EOp:
    left:Chexpr
    op:str
    right:Chexpr
    loc: tuple[int, int] | None = None


    def __or__(self, loc):
        self.loc = loc
        return self


Chexpr = EVal | EVar | EApp | EIt | EAttr | EPar | EDict | EList | ENot | ENeg | EInv | EAnd | EOr | EOp