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
