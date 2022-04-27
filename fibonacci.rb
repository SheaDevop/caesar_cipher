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
    return result
end

def fibonacci(n)
    return n if n < 2
    return (fibonacci(n-1) + fibonacci(n-2))
end

def fibs_rec(n)
    result = []
    for i in 0..n
        result << fibonacci(i)
    end
    return result
end
