log({1: 2, "3": 4})
log({1: 2, (1, 2): 3})

c = (1, 2)
d = {1: 2, c: 3}

log(d.[1])

log(d.[c])

log(d.[(1,2)])


if 5 in d then
    log("有病吧?(failed)")
else
    log("我似楞啊?(success)")
end


if 5 not in {1: 2, "5": []} then
    log("正确的")
elif 2 ** 4 in [17] then
    log("错误的")
end

z = if 10 in {1: 2, "5": []} then
    log("错误的")
elif 2 ** 4 in [17] then
    log("错误的")
end

if (z == None) then
    log("正确的")
else
    log("错误的")
end



builder = {
    "start": fun ()
        log("started!")
        {
            "do": (x) -> log("do" + str(x)),
            "finish": () -> log("finished!")
        }
     end
}

builder {
    do 1
    do 2
    do 3
}

builder = {
    "start": fun()
         x  = {}
        x.["yield"] = x -> log("yield " + str(x))
        x.["finish"] = () -> ()
        return x
    end
}



builder {
    yield 1
    yield 2
}



k = {1 : 2}
z = [None]
dict.search(k, 1, z)
log(z)

z = [None]
log(dict.search(k, 10, z))
log(z)