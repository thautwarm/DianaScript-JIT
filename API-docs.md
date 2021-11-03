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


### `Num`

- `Num.get_max`: get max of float32 value
- `Num.get_min`: get min of float32 value
- `Num.of`: convert to `Num`, from `Str`, `Int` or `Num`

### `Str`

- `Str.of`: convert any to `Str`
- `Str.join(Str, Enum<any>)`
- `Str.concat(Enum<any>)`
- `Str.endswith(Str, Str)`
- `Str.startswith(Str, Str)`
- `Str.len(Str): Int`
- `Str.strip(Str, Str?)`

    wrap of `Systen.String.Trim`; when the second argument is not provided, trim left and right whitespaces.

- `Str.lstrip(Str, Str?)`
    
    wrap of `Systen.String.TrimStart`; when the second argument is not provided, trim left whitespaces.

- `Str.rstrip(Str, Str?)`
     wrap of `Systen.String.TrimEnd`; when the second argument is not provided, trim right whitespaces.

- `Str.lower(Str)`
     wrap of `Systen.String.ToLowerInvariant`

- `Str.contains(String): Int` : return 0 if false, or 1 if true

- `Str.format(Str, any1, any2, ...)`: equivalent to `System.String.Format`.

- `Str.substr(Str, Int, Int?)`

     wrap of `Systen.String.Substring`; **the third argument is the length** of the substring


- `Str.insert(Str, Int, Str)`

     wrap of `Systen.String.Insert`

- `Str.remove(Str, Int, Str)`

     wrap of `Systen.String.remove`

- `Str.index(Str, Str, Int?, Int?)`

    wrap of `Systen.String.IndexOf`


