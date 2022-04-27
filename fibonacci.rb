def fibs(n)
    result = []
    a = 0
    b = 1
    c = 0
    while n > 0 do
        result << c
        a = b
        b = c + a
        c = a
        n -= 1
    end
    p result
    return result
end

fibs(0)
fibs(1)
fibs(2)
fibs(3)
fibs(4)
fibs(5)
fibs(6)
fibs(14)