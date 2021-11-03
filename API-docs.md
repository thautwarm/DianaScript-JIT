## Basic Types

In C# side, every thing in DianaScript is a class that interfaces `DObj`.

You can access `DObj.Native` to access their .NET representation:

| Types | .NET representation | Literal Examples | 
| --- | --- | --- |
 | Int  | int64(System.Int64) | `1, 0xef, 0b01, 0o33` |
 | Num |  float32(System.Single)  | `1.0` | 
 |  Str | string(unicode-16 string) | `"ava"`, `"bela\\"la"` |
 | Dict | Dictionary\<DObj,DObj\> | `{1: 2, "3": 4}`, `{1, 2, 3}`(just like sets) |
 | List | List\<DObj\> | `[1, 2, if 1 then 2 else 3 end]` |
 | Tuple | DObj[](immutable in Diana)  | `(1, ), (1, 2), (,), ()` |
 | Enum | IEnumerable\<DObj\> | `List.map([1, 2], x -> x + 10)`  |
 | None | an empty struct `DNone` | `None` |
 | Func | functions | `x -> x, fun myfunc(x) return x end` |


## Operators

| Operator | Descrption | Supported Types | 
|--|--| --| 
|+| addition | `Int, Num, List(concat), Tuple(concat)` |
|-| subtraction | `Int, Num, Dict(set difference)` |
|*| multiplication | `Int, Num, Str(repeat)` | 
|**| power | `Int, Num` | 
|/|float division | `Int, Num, Dict(quotient set)` |
|//|floor division(get integer) | `Int, Num` | 
|%| modulo(not remainder) | `Int, Num` |
|^| bitwise xor | `Int, Num` |
|&| bitwise and/intersect | `Int, Num, Dict(set intersect)` |
|\|| bitwise or/union |  `Int, Num, Dict(set union)` |
|!=| non-equality | All |
|==| equality | All |
|>, <, >=, <=| inequality | `Int, Num, Tuple` |
|in/not in| not contained | right-hand side `Dict(use key), List, Tuple` |
| << | left shift | `Int`(higher bits are circular) |
| >> | zero-fill right shift |  `Int`(discard lower bits) |

## Modules and Methods

### `Int`

- `Int.get_max`: get max of int64 value
- `Int.get_min`: get min of int64 value
- `Int.of`: convert to `Int`, from `Str`, `Int` or `Num`
