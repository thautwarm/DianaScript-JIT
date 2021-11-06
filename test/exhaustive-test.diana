print = log

print("================================================")

True = 1
False = 0

log(2, 3)
fun assert_and_print(test, msg)
     a = assert(test, msg)
    assert(a == None)
    print("passed: ", msg)
end

x = 2

fun f(x)
    var x, y
    x = 3
    y = 2
    assert_and_print(x == 3, "local assign")
    log(y)
end

assert_and_print(x == 2, "global not polluted")

f(2)

fun f3(x, y, z)

end

f3(1, 2, 3)

fun test_assign(x, y, z)
    x = y = z
    a = x
    assert_and_print((x == a and y == a and z == a), "multi assign")
end

test_assign(1, 2, 3)



fun test_loop_break_and_continue()
    x = 0
    loop    
        if x < 100 then
            x = x + 1
            continue
        end
        
        break
    end

    assert_and_print(x == 100, "loop break and continue")
end

test_loop_break_and_continue()


fun test_loop_break()
    var x
    x = 0
    loop
        if x < 100 then
            x = x + 1
        else
            
            break
        end
    end

    assert_and_print(x == 100, "loop break")
end

fun test_foreach()
    var sum, xs, k
    xs = [1, 2, 3, 4, 5]
    sum = 0
    for _ in xs do
        sum = sum + 1
    end
    assert_and_print(sum == 5, "foreach without lhs")
    sum = 0
    for x in xs do
        
        k = x
        
        
        sum = sum + k
    end
    assert_and_print(sum == 15, "foreach with lhs")
end


test_foreach()


fun test_if()
    var x
    if True then
        assert_and_print(True, "no else")
    end
    
    if False then
        x = 555
    else
        x = 333
    end
    assert_and_print(x != 555, "no else and false")

    if True then
    else
        x = 781123
    end

    assert_and_print(x != 781123, "no then and true")
    
    if False then
        
    else
        x = 781123
    end

    assert_and_print(x == 781123, "no then and false")

end

test_if()

BAD = False
fun test_return(x)
    var x, BAD
    if x == 1 then
        return "return in if"
        BAD = True
    end

    if x == 2 then
        loop
            return "return in loop"
            BAD = True
        end
    end

    if x == 3 then
        for x in [1, 2, 3, 4, 5, 6, 7, 8, 9] do
            if x > 3 then
                return "return in for"
            end
        end
        BAD = True
    end


    if x == 4 then
        for x in [1, 2, 3, 4, 5, 6, 7, 8, 9] do
            x = x + 1
            loop 
                
                x = x + 1
                break
            end
            assert_and_print(x == 3, "just break")
            
            loop
                
                loop
                    BAD = True
                    break
                end
                                
                loop
                    BAD = False
                    return "nested loop return"

                end
            end
        end
        BAD = True
    end
    
    BAD = True
    return "failed"
end

msg = test_return(1)
assert_and_print(BAD != True, msg)

msg = test_return(2)
assert_and_print(BAD != True, msg)

msg = test_return(3)
assert_and_print(BAD != True, msg)


msg = test_return(4)
assert_and_print(BAD != True, msg)


fun test_shortcuts()
    var x
    True or assert_and_print(False, "failed at (True or _)")

    False or assert_and_print(True, "succeeded at (False or _)")

    x = 1

    False or assert(x == 1)

    True and assert_and_print(True, "succeeded at (True and _)")

    False and assert_and_print(False, "failed at (False and _)")

    (True and True and print(2)) or print("(print(2) or _)")
end


test_shortcuts()

fun bool(x)
    if x then
        return True
    else return False
    end
end

log("not 1:" + (not 1))

fun test_not()
    assert_and_print(not 1 == False, "not 1 == False")
    assert_and_print(bool(10) == True, "not 10 == False")
end

test_not()

print({}, {1: 2}, {1: 2, 3: 4})
print((1, ))

print(0b01 << 33)



x = 2

x += 3

assert_and_print(x == 5, "assign global var")

x = [2]

x.[0] += 3

assert_and_print(x.[0] == 5, "assign global list")

x = None

fun test_local_assign()
    var x
    x = 2

    x += 3

    assert_and_print(x == 5, "assign local var")

    x = [2]

    x.[0] += 3

    assert_and_print(x.[0] == 5, "assign local list")
end

test_local_assign()




fun test_closure(x, z, k)
    var u
    u = 8
    fun (y)
        (x + y) * k * u + z
    end
end

assert_and_print(test_closure(1, 2, 3)(4) == 122, "test closure capture")

a = [1, 2, 3]
b = List.copy(a)

b.[0] = 5
assert_and_print(a == [1, 2, 3], "test shallow copy 1")
assert_and_print(b == [5, 2, 3], "test shallow copy 2")


a = {1: 1, 2: 2, 3: 3}
b = Dict.copy(a)

b.[1] = 5
assert_and_print(a == {1: 1, 2: 2, 3: 3}, "test shallow copy 3")
assert_and_print(b == {1: 5, 2: 2, 3: 3}, "test shallow copy 4")