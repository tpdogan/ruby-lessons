def factorial(n)
  return 1 if n<1
  n * factorial(n-1)
end

puts factorial(5)

def palindrome(str)
  return true if str.length < 2
  len = str.length
  if str[0]==str[len-1]
    palindrome(str[1..len-2])
  else
    false
  end
end

puts palindrome('qapaq')
puts palindrome('paq')

def bottles(n)
  if n==0; p "No more bottles"; return; end
  p "#{n} bottles"
  bottles(n-1)
end

bottles(6)

def rand_array(n,upto)
  ary = []
  while n>0 do
    ary.push(rand(upto))
    n -= 1
  end
  return ary
end

def flat(ary)
  return [ary] if !ary.is_a? Array
  ary1 = flat(ary[0])
  ary2 = ary[1..ary.length-1]
  ary2 = ary2.is_a?(Array) ? flat(ary2) : ary2

  if ary2==nil || ary2==[nil]
    return ary1
  else
    return ary1 + ary2
  end
end

p fary = [rand_array(3,10), [rand_array(2,10), rand_array(1,1)]]
p flat(fary)

def fibonacci(n)
  return n if n<2
  fibonacci(n-1) + fibonacci(n-2)
end

puts fibonacci(7)

def merge_sort(ary)
  return [ary] if !ary.is_a? Array

  len = ary.length
  return ary if len == 1

  a1 = merge_sort(ary[0..(len/2-1)])
  a2 = merge_sort(ary[(len/2)..len-1])
  
  merged = []
  while !a1.empty? && !a2.empty? do
    if a1[0] < a2[0]
      merged.push(a1[0])
      a1.shift(1)
    else
      merged.push(a2[0])
      a2.shift(1)
    end
  end
  if a1.empty?; merged + a2.to_a
  else; merged + a1.to_a; end
end

p merge_sort([2,1,4,3])
p merge_sort([2,5,4,8,1,5,0])
p merge_sort(rand_array(10,100))
