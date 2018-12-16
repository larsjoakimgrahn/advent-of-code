def addr(register, a, b, c)
    result = register.dup
    result[c] = register[a] + register[b]
    result
end
def addi(register, a, b, c) 
    puts "addi: #{register}, #{a}, #{b}, #{c}"
    result = register.dup
    result[c] = register[a] + b 
    result
end
def mulr(register, a, b, c)
    result = register.dup
    result[c] = register[a] * register[b]
    result
end
def muli(register, a, b, c) 
    result = register.dup
    result[c] = register[a] * b
    result
end
def banr(register, a, b, c)
    result = register.dup
    result[c] = register[a] & register[b]
    result
end
def bani(register, a, b, c) 
    result = register.dup
    result[c] = register[a] & b 
    result
end
def borr(register, a, b, c)
    result = register.dup
    result[c] = register[a] | register[b]
    result
end
def bori(register, a, b, c) 
    result = register.dup
    result[c] = register[a] | b 
    result
end
def setr(register, a, b, c) 
    result = register.dup
    result[c] = register[a] 
    result
end
def seti(register, a, b, c) 
    result = register.dup
    result[c] = a 
    result
end
def gtir(register, a, b, c)
    result = register.dup
    result[c] = a > register[b] ? 1 : 0
    result
end
def gtri(register, a, b, c)
    result = register.dup
    result[c] = register[a] > b ? 1 : 0
    result
end
def gtrr(register, a, b, c)
    result = register.dup
    result[c] = register[a] > register[b] ? 1 : 0
    result
end
def eqir(register, a, b, c)
    result = register.dup
    result[c] = a == register[b] ? 1 : 0
    result
end
def eqri(register, a, b, c)
    result = register.dup
    result[c] = register[a] == b ? 1 : 0
    result
end
def eqrr(register, a, b, c)
    result = register.dup
    result[c] = register[a] == register[b] ? 1 : 0
    result
end