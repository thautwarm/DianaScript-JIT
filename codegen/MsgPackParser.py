# Generated from lark-action.


from __future__ import annotations

if '_get_location' not in globals(): 
    def _get_location(token):
        return (token.line, token.column)

if '_get_value' not in globals(): 
    def _get_value(token):
        return token.value



from dataclasses import dataclass, replace
from pyrsistent import PVector, pvector

def append(self, x):
    self.append(x)
    return self

@dataclass(frozen=True)
class TArr:
    eltype : Type

@dataclass(frozen=True)
class TTup:
    eltypes : PVector[Type]

@dataclass(frozen=True)
class TName:
    name: str


@dataclass(frozen=True)
class Field:
    type: Type
    name: str

Type = TName | TTup | TArr
    
@dataclass(frozen=True)
class Def:
    name: str
    fields: PVector[Field] = pvector([])
    tag: int = -1

    def __iter__(self):
        yield from self.fields
    def __len__(self):
        return len(self.fields)

tag_counter = [0]

def next_tag():
    x = tag_counter[0]
    tag_counter[0] += 1
    return x


from MsgPackParser_raw import Transformer, Lark_StandAlone, Tree
class MsgPackParser_Transformer(Transformer):

    def name_0(self, __args):
        return  str(__args[1-1])
    def list_0(self, __args):
        return  [__args[1-1]]
    def list_1(self, __args):
        return  append(__args[1-1], __args[2-1])
    def seplist_0(self, __args):
        return  [__args[1-1]]
    def seplist_1(self, __args):
        return  append(__args[1-1], __args[3-1])
    def nullable_0(self, __args):
        return  []
    def nullable_1(self, __args):
        return  __args[1-1]
    def type_0(self, __args):
        return  TTup(pvector(__args[2-1]))
    def type_1(self, __args):
        return  TArr(__args[1-1])
    def type_2(self, __args):
        return  TName(__args[1-1])
    def field_0(self, __args):
        return  Field(__args[3-1], __args[1-1])
    def field_1(self, __args):
        return  Field(__args[1-1], __args[2-1])
    def topl_0(self, __args):
        return Def(name= __args[1-1], fields=__args[3-1], tag=next_tag())
    def start_0(self, __args):
        return  __args[1-1]


parser = Lark_StandAlone(transformer=MsgPackParser_Transformer())
if __name__ == '__main__':

        import prettyprinter
        prettyprinter.install_extras(["dataclasses"])
        while True:
            print("input q and exit.")
            source = input("> ")
            if source.strip() == "q":
                break
            if not source.strip():
                continue
            res = parser.parse(source)
            if not isinstance(res, Tree):
                prettyprinter.pprint(res)
            else:
                print(res)
            
