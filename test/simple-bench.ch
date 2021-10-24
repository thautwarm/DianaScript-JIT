x = 1
log(x)

func f(x)
    return x + x
end

log(2 + f(1))


if 1 > 2 then
    log("2")
else
    log("3")
end

func fact(x)
    if x < 1 then
        log("ret")
        return 1
    else
        r = x * fact(x - 1)
        log(r, "<- ret")
        return r
    end
end

log(f(10))

x = 10
log("hhh")

if x < 5 then
    log(1)
else
    log(x)
end


log("y", fact(5))
log([1, 2, 3])

log([1, 2, 3].[0])

if x + 1 == 2 then
else
    log(3)
end

func g()
    
    for i in [1, 2, 3, 4] do
        log(i)
    end
end

g()

log(int("233"))

x = time()

func test()
    loop
        if x < 10000000 then
            break
        end
        x = x + 1
    end
end

log((time() - x))

log((time() - time()))
log((time() - time()))
log((time() - time()))
log((time() - time()))
log((time() - time()))
log((time() - time()))
log((time() - time()))
log((time() - time()))
log((time() - time()))
log((time() - time()))
log((time() - time()))
log("aaa")



func test2()
    
    x = 0
    loop
        if x > 10000000 then
            break
        end
        x = x + 1
    end
    return x
end


func benchfunc(f)
    x = time()
    f()
    span = time() - x
    log("time elapsed for " + str(f) + ":", span)
end

benchfunc(test2)
benchfunc(test2)
benchfunc(test2)

if 0 > 1000 then
    log("写写嘛, 没事的!")
else
    log("皮套狗能不能爬?呕")
end


