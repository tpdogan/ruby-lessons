# First piece
glad = true
if glad
    p 'Happy to see you'
else
    p 'Get the f out'
end
# Second piece
short = true
p 'You want the short answer, I see..' if short
# Third piece
print 'What is your age: '
#userAge = gets.to_i
userAge = 30
if userAge < 18
    p 'You are young.'
elsif userAge < 65
    p 'Hello lad.'
else
    p 'What up daddyoo'
end
# Fouth piece
int5 = 5
puts int5.eql?(5.0) # checks both type and value
# Fifth piece
int5_2 = 5
puts int5.equal?(int5_2) # checks type, value and memory
                         # for num types storage is the same
str1 = 'Same'
str2 = 'Same'
puts %{Are #{str1} and #{str2} the same? -> #{str1.equal?(str2)}}
# Sixth piece
puts a = 5<=>10
b = 10<=>10
c = 10<=>5
puts a+b+c
# Seventh piece
puts 'Are' < 'You'
puts 'Are' <=> 'You'
# Eighth piece
num1 = 4
num2 = 5
sense = true
if num1 < 4 || num2 > 5
    num1 = num2
elsif num1 > 4 && num2 < 5
    num1 = num2/2
else
    num1 = 0;
end
puts %{#{num1} and #{num2} and #{!sense}}
# Nineth piece
initial = 'C'
name = case initial
when 'A' then 'Andy'
when 'B' then 'Bert'
when 'C'
    'Chang the chong'
else 'Jason'
end
puts name
# Tenth piece
unless name=='Jason'
    puts 'You lose due to name'
else
    puts 'You are born lucky'
end
# Eleventh piece
puts userAge==30 ? 'Time for a change, lad!' : 'You are not bored'
if userAge!=30 then puts 'What are you doing' end
puts 'Come on, man' if userAge%3 == 0
# Twelveth piece
def caser(str)
    if str.length<10
        return str
    else
        return str.upcase
    end
end
puts caser(str1)
puts caser('good morning')
# Thirteenth piece
def range(num)
    case
    when num < 0
        puts 'Smaller than 0'
    when num > 0 && num < 50
        puts 'Between 0 and 50'
    when num > 50 && num <100
        puts 'Between 50 and 100'
    else
        puts 'Larger than 100'
    end
end
print 'Enter a number: '
userNum = gets.chomp.to_i
range(userNum)