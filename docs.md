## 语法Cheat Sheet

```ruby
# this is a comment
x = x[1] = 3  # multi-target assignment


# variable declaration.
# if no declaration in scope, regarded as a global variable.
var x


x = 0
loop
    # if .. then ... end
    if x > 100 then
        break
    end
    x += 1
end

# above loop is equivalent to

x = 0
while x <= 100
    x += 1
end

# for loop
for i in Enum.range(20) do
    log(i) # of course you can use 'break' and 'continue'
end
# 0
# 1
# ...
# 19

x = [1, 2, 3] # mutable list

x[0] # 1
x[1] = 3 # x == [1, 3, 3]

x = (1, ) # tuple
x > (0, 1) # return 1(means 'true')
x > (1, 1) # return 0(means 'false')

x = {} # set，as well as a None-value dictionary
x[1] = None
log(x) # {1}

x[2] = 10; log(x) # {1, 2:10}

x.attr = 20 # equivalent to '["attr"] = 20'
log(x) # {1, 2:10, "attr": 20}

z = if 1 then 0 else 1 end # if-expression

# multi-arm if-expression
if cond1 then
    1
elif cond2 then
    2
elif cond3 then
    3
else
    4
end


# function
fun add(x, y)
    x + y # no need to explicitly return here
end

# function is a value
add = fun (x, y)
    x + y
end

# if your function body is an expression
mul10 = x -> x * 10
```

## Basic Types

In C# side, every thing in DianaScript is an instance whose class interfaces `DObj`.

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

`**` is right-associative.


| Operators | Descrption | Supported Types | Precedence |
|--|--| --| -- |
|+| addition | `Int, Num, List(concat), Tuple(concat)` | 7 |
|-| subtraction | `Int, Num, Dict(set difference)` | 7 | 
|*| multiplication | `Int, Num, Str(repeat)` | 8 |
|**| power | `Int, Num` | 9 |
|/|float division | `Int, Num, Dict(quotient set)` | 8 |
|//|floor division(get integer) | `Int, Num` | 8 |
|%| modulo(not remainder) | `Int, Num` | 8 |
|^| bitwise xor | `Int, Num` | 4 |
|&| bitwise and/intersect | `Int, Num, Dict(set intersect)` | 5 |
|\|| bitwise or/union |  `Int, Num, Dict(set union)` | 3 |
|!=| non-equality | All | 2 | 
|==| equality | All | 2 | 
|>, <, >=, <=| inequality | `Int, Num, Tuple` | 2 | 
| ~ | bit invert | `Int` | MAX |
| - | unary minus | `Int, Num` | MAX |
| not | negation | any | MAX |
| << | left shift | `Int`(higher bits are circular) | 6  |
| >> | zero-fill right shift |  `Int`(discard lower bits) | 6 | 
| not in/in | check if/if not contained | any in/not in `List/Set/Tuple/String`  | 2 | 

## Modules and Methods

### `Int`

- `Int.get_max()`: get max of int64 value
- `Int.get_min()`: get min of int64 value
- `Int.of(Str | Int | Num)`: convert to `Int`, from `Str`, `Int` or `Num`


### `Num`

- `Num.get_max`: get max of float32 value
- `Num.get_min`: get min of float32 value
- `Num.of(Str | Int | Num)`: convert to `Num`, from `Str`, `Int` or `Num`

### `Str`

We omit the return type when it is `Str`.

- `Str.of(any)`: convert any to `Str`
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

- `Str.lower(Str)`, `Str.upper(Str)`
     wrap of `Systen.String.ToLowerInvariant/ToUpperInvariant`

- `Str.contains(String): Int` : return 0 if false, or 1 if true

- `Str.format(Str, any1, any2, ...)`: equivalent to `System.String.Format` in .NET.

- `Str.substr(Str, Int, Int?)`

     wrap of `Systen.String.Substring`; **the third argument is the length** of the substring


- `Str.insert(Str, Int, Str)`

     wrap of `Systen.String.Insert`

- `Str.remove_at(Str, Int, Str)`

     wrap of `Systen.String.Remove`

- `Str.index(Str, Str, Int?, Int?)`

    wrap of `Systen.String.IndexOf`


## Tuple

A `Tuple` is an `Enum`.

- `Tuple.of(Enum<any>): Tuple`: convert any enumerable of diana objects to a tuple
- `Tuple.len(Tuple): Int`
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

- `List.of(Enum<any>): List`: `Enum` to `List`
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

- `Dict.of(Enum): Dict`: from an enumerable of 2-element tuple to a dictionary
- `Dict.setOf(Enum): Dict`: construct a set from an enumerable
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

- `Dict.update(Dict, Dict)`: update the first dict with key-values pairs in the second dict
- `Dict.forkey(Dict, function)`


## Enum

- `Enum.foreach(Enum, func): None`

- `Enum.map(Enum, func): Enum`

- `Enum.mapi(Enum, func): Enum` : the function should take 2 arguements, the first of which is the integer index of the enumerable.
- `Enum.range(Int start, Int end, Int sep)`
- `Enum.range(Int n)`

