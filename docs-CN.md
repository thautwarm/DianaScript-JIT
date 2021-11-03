
## 语法Cheat Sheet

```ruby
# 这是一个注释
k = x[1] = 3  # 连续赋值


# 变量声明；不声明则是全局变量
var x


x = 0
# 循环
loop
    # if .. then ... end
    if x > 100 then
        break
    end
    x += 1
end

# 以上循环等价于
x = 0
while x <= 100
    x += 1
end

for i in Enum.range(20) do
    log(i) # 当然，你可以在循环中使用break和continue
end
# 0
# ...
# 19

x = [1, 2, 3] # 列表

x[0] # 1
x[1] = 3 # x == [1, 3, 3]

x = (1, ) # 元组
x > (0, 1) # 返回1
x > (1, 1) # 返回0

x = {} # 集合，同时也是值为None的字典
x[1] = None
log(x) # {1}

x[2] = 10; log(x) # {1, 2:10}

x.attr = 20 # 等价与x["attr"] = 20
log(x) # {1, 2:10, "attr": 20}

z = if 1 then 0 else 1 end # if 是表达式

# 多条件
if cond1 then
    1
elif cond2 then
    2
elif cond3 then
    3
else
    4
end


# 函数
fun add(x, y)
    x + y # 不需要显式return
end

# 函数是值。函数是表达式。函数可以匿名。
add = fun (x, y)
    x + y # 不需要显式return
end

# 如果函数体是一个简单的表达式
mul10 = x -> x * 10
```

## 基础类型

在C#中, DianaScript的所有对象都实现interface `DObj`。

你可以使用 `DObj.Native` 来获取它们的.NET表示形式。

| 类型 | .NET 表示 | 字面量例子 | 
| --- | --- | --- |
 | Int  | int64(System.Int64) | `1, 0xef, 0b01, 0o33` |
 | Num |  float32(System.Single)  | `1.0` | 
 |  Str | string(unicode-16 字符串) | `"ava"`, `"bela\\"la"` |
 | Dict | Dictionary\<DObj,DObj\> | `{1: 2, "3": 4}`, `{1, 2, 3}`(字典也是集合) |
 | List | List\<DObj\> | `[1, 2, if 1 then 2 else 3 end]` |
 | Tuple | DObj[] (在Diana中不可变)  | `(1, ), (1, 2), (,), ()` |
 | Enum | IEnumerable\<DObj\> | `List.map([1, 2], x -> x + 10)`  |
 | None | 一个空结构体 `DNone` | `None` |
 | Func | 函数 | `x -> x, fun myfunc(x) return x end` |


## 运算符

| 运算符 | 描述 | 支持的类型 | 
|--|--| --| 
|+| addition | `Int, Num, List(拼接语义，后同), Tuple` |
|-| subtraction | `Int, Num, Dict(集合的差)` |
|*| multiplication | `Int, Num, Str(重复字符串)` | 
|**| power | `Int, Num` | 
|/|float division | `Int, Num, Dict(商集)` |
|//|floor division(get integer) | `Int, Num` | 
|%| modulo(not remainder) | `Int, Num` |
|^| bitwise xor | `Int, Num` |
|&| bitwise and/intersect | `Int, Num, Dict(集合交)` |
|\|| bitwise or/union |  `Int, Num, Dict(集合并)` |
|!=| non-equality | All |
|==| equality | All |
|>, <, >=, <=| inequality | `Int, Num, Tuple` |
| ~ | 字节逆 | `Int` | MAX |
| - | 取负 | `Int, Num` | MAX |
| not | 取否定 | any | MAX |
| << | 左移字节 | `Int`(高位字节溢出会循环) |
| >> | 零填充右移字节 |  `Int`(低位字节被舍弃) |
| in/not in | 检查存在性 | 检查键/元素是否存在于 `Dict/List/Set/Tuple/String`  | 

## Modules and Methods

### `Int`

- `Int.get_max()`: int64 最大值
- `Int.get_min()`: int64 最小值（包括负数）
- `Int.of`: 转为 `Int`, 从 `Str`, `Int` 或 `Num`


### `Num`

- `Num.get_max`: float32 最大值
- `Num.get_min`: float32 最小值（包括负数）
- `Num.of`: 转为 `Num`, 从 `Str`, `Int` 或 `Num`

### `Str`

每个Str都是一个Enum;

省略返回类型时，默认返回当前模块代表的类型，即`Str`.

- `Str.of`: 把任意对象转为 `Str`
- `Str.join(Str, Enum<any>)`
- `Str.concat(Enum<any>)`
- `Str.endswith(Str, Str)`
- `Str.startswith(Str, Str)`
- `Str.len(Str): Int`
- `Str.strip(Str, Str?)`

    `Systen.String.Trim`的Diana包装; 当不给出第二个参数时, 去掉字符串左右的空白符.

- `Str.lstrip(Str, Str?)`
    
    `Systen.String.TrimStart`的Diana包装; 当不给出第二个参数时, 去掉字符串左端的空白符.

- `Str.rstrip(Str, Str?)`
     wrap of `Systen.String.TrimEnd`; 当不给出第二个参数时, 去掉字符串右端的空白符.

- `Str.lower(Str)`, `Str.upper(Str)`
     wrap of `Systen.String.ToLowerInvariant/ToUpperInvariant`；将其中的英文字母全部转为小/大写

- `Str.contains(String): Int` : 如果不包括，返回 0， 否则返回 1

- `Str.format(Str, any1, any2, ...)`: 等价于.NET的 `System.String.Format`.

- `Str.substr(Str, Int, Int?)`

     wrap of `Systen.String.Substring`; **第三个参数是子字符串的长度**


- `Str.insert(Str, Int, Str)`

     wrap of `Systen.String.Insert`

- `Str.remove_at(Str, Int, Str)`

     wrap of `Systen.String.Remove`

- `Str.index(Str, Str, Int?, Int?)`

    wrap of `Systen.String.IndexOf`


## Tuple

每个Tuple都是一个Enum

- `Tuple.of(Enum<any>): Tuple`: 把`Enum`转为`Tuple`
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

- `List.of(Enum<any>): Tuple`: 把`Enum`转为`List`
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

`Dict` 也是 `Set`; 一个 `Set` 是一个键对的值为`None`的`Dict`。

- `Dict.of(Enum): Dict`: 从一个包含2个元素的元组(Tuple)转为字典(Dict)
- `Dict.setOf(Enum): Dict`: 从Enum转为Set
- `Dict.remove(Dict, any key): None`
- `Dict.clear(Dict)`
- `Dict.len(Dict): int`
- `Dict.len(Dict): int`
- `Dict.contains(Dict d, any key): Int`: 等价于 `key in d` 或 `not (key not in d)`
- `Dict.search(Dict, any key, List ref): Int`

    wrap of `System.Collections.Generic.Dictionary.TryGetValue`.
    
    找到`key`则返回1，并将`ref`的第一个元素设置为找到的值; 否则返回0

    ```python
    found_ref = [None]
    Dict.search({"key": "value"} 1, found_ref) # 1
    found_ref # ["value"]
    ```

- `Dict.subtract(Dict, Enum)`: 和集合的`-`运算符一致; set difference

    ```python
    x = {1, 2, 3}
    Dict.subtract(x, [1, 2]) # {3}
    ```
- `Dict.union(Dict, Enum)`: 和集合的`|`运算符一致;; set union

- `Dict.intersect(Dict, Enum)`: 和集合的`&`运算符一致;; set intersect

- `Dict.update(Dict, Dict)`: 用第二个字典的键对更新第一个字段
- `Dict.forkey(Dict, function)`


## Enum

- `Enum.foreach(Enum, func): None`

- `Enum.map(Enum, func): Enum`

- `Enum.mapi(Enum, func): Enum` : 这个函数参数接受两个参数；其中第一个参数是整数，表示当前元素在序列中的序号.

- `Enum.range(Int start, Int end, Int sep)`
- `Enum.range(Int n)`


