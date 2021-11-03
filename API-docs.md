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
| ~ | bit invert | `Int` | 
| << | left shift | `Int`(higher bits are circular) |
| >> | zero-fill right shift |  `Int`(discard lower bits) |
| not in/in | check if/if not contained | any in/not in `List/Set/Tuple/String`  | 

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

We omit the return type when it is `Str`.

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

- `Str.remove_at(Str, Int, Str)`

     wrap of `Systen.String.remove`

- `Str.index(Str, Str, Int?, Int?)`

    wrap of `Systen.String.IndexOf`


## Tuple

- `Tuple.len(Tuple): Int`

- `Tuple.of(Enum<any>): Tuple`: convert any enumerable of diana objects to a tuple

- `Tuple.forkey(Tuple, function): None`

    ```elixir
    xs = (2, 4, 6)
    Tuple.forkey(log)
    # 0
    # 1
    # 2

    # you might use 'Enum.foreach(xs, log)' for this
    Tuple.forkey(i -> log(xs[i]))
    # 2
    # 4
    # 5
    ```
## List

- `List.push(List, any)`
- `List.pop(List): any`
- `List.extend(List, Enum<any>)`
- `List.clear(List)`
- `List.find(List, function)`

    ```elixir
    List.find([1, 6, 3], x -> x % 2 == 0)
    # 6

    List.find([1, 6, 3], x -> x > 20)
    # None
    ```
- `List.index(List, any, Int?)`

    wrap of `System.Collections.Generic.List.IndexOf`

- `List.remove_at(List, Int)`

    wrap of `System.Collections.Generic.List.RemoveAt`

- `List.forkey(List, function)`

    ```julia
    var lst
    lst = [1, 2, 3]
    List.forkey(lst, i -> func(lst[i])) # == 'Enum.foreach(lst, func)'
    ```

- item index operator:

    ```lua
    x = [1, 2, 3]
    x[1]
    x[1] = 2
    ```

- `in`, `not in`: `elt in lst == not (elt not in lst)`

## Dict

`Dict` is also `Set`; a `Set` is a `Dict` whose values are `None`.

- `Dict.remove(Dict, any key): None`
- `Dict.clear(Dict)`
- `Dict.len(Dict): int`
- `Dict.len(Dict): int`
- `Dict.contains(Dict d, any key): Int`: same as `key in d` or `not (key not in d)`
- `Dict.search(Dict, any key, List ref): Int`

    wrap of `System.Collections.Generic.Dictionary.TryGetValue`.
    
    return 1 if key is found, and set the first element of argument `ref` to the value; otherwise return 0.

    ```python
    found_ref = [None]
    Dict.search({"key": "value"} 1, found_ref) # 1
    found_ref # ["value"]
    ```

- `Dict.subtract(Dict, Enum)`: same as `-` operator for dictionaries; set difference

    ```python
    x = {1, 2, 3}
    Dict.subtract(x, [1, 2]) # {3}
    ```
- `Dict.union(Dict, Enum)`: same as `|` operator for dictionaries; set union

- `Dict.intersect(Dict, Enum)`: same as `&` operator for dictionaries; set intersect

- `Dict.forkey(Dict, function)`

## Enum

- `Enum.foreach(Enum, func): None`

- `Enum.map(Enum, func): Enum`

- `Enum.mapi(Enum, func): Enum` : the function should take 2 arguements, the first of which is the integer index of the enumerable.

