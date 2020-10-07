# Snippet 1
i = 0
loop do
    puts i += 1
    break if i > 10
end
# Snippet 2
while i > 0 do
    i -= 2
    if i == 5
        next
    end
    puts i
end
# Snippet 3
until i>100 do
    puts i *= -10
end
# Snippet 4
(1..4).each do
    puts i += 1
end
# Snippet 5
for j in 0...5
    puts %{i + j = #{i+j}}
end
# Snippet 6
10.times do
    print 'xo'
end
puts 'x'
# Snippet 7
5.upto(10) {|ch| print ch.to_s + ''}
8.downto(2) {|ch| print ch.to_s + '->'}
puts ''
# Snippet 8
alphabet = ['a','b','c','d','e','f']
alphabet.each {|ch| puts ch.upcase}
# Snippet 9 # Recursion
def doubler(num)
    puts num
    if num < 100
        doubler(num*2)
    end
end
doubler(2)
# Snippet 10 # Recursion Fibonacci 1
def fibonacci(a,b,num)
    c = a + b
    if c < num
        print c.to_s + ','
        fibonacci(b,c,num)
    end
end
fibonacci(0,1,20)
puts 'end'
# Snippet 11 # Recursion Fibonacci 2
def fibonacci2(num)
    a = 0; b = 1
    array = [a,b]
    def inner(a,b,num,array)
        c = a + b
        array += [c]
        if c < num
            array = inner(b,c,num,array)
        end
        return array
    end
    array = inner(a,b,num,array)
    return array
end
list = fibonacci2(20)
puts list.join('+')
# Snippet 12 # Recursion Fibonacci 3
def fibonacci3(num)
    array = [0,1]
    def inner(num,array)
        array += [array[-1] + array[-2]]
        if array[-1] < num
            array = inner(num,array)
        end
        return array
    end
    array = inner(num,array)
    return array
end
list = fibonacci3(30)
puts list.join('|')
# Snippet 13 # Recursion countdown
def countdown(num)
    puts num
    if num > 0
        countdown(num-1)
    end
end
countdown(10)