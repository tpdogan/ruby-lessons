def mult2(val = 1)
    val*2
end
puts mult2(3)
puts mult2
def checkNum(number)
    unless number.is_a? Numeric
        return 'NaN'
    end
    number
end
puts checkNum('1')
puts checkNum(1)
puts checkNum(mult2(2))
puts 21.between?(11,21)
puts mult2 12
def greet(name)
    puts "Hello #{name}"
end
greet "Jason"
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
p friends.select! {|dude| dude!='Brian'}
p friends.map! {|dude| dude.upcase}
p friends.map! {|dude| dude.gsub('A','a')}
responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
p responses.select {|k,v| v == 'yes'}
votes = ['burger','pizza','pizza','pizza']
votes.reduce(Hash.new(0)) {|result, vote| result[vote] += 1; p result}
p (1..5).to_a.sample
p responses.any? {|name, resp| resp == 'no'}
p responses.all? {|name, resp| resp == 'no'}
p responses.none? {|name, resp| resp == 'no'}
p responses.one? {|name, resp| resp == 'no'}
p responses.find {|name, resp| resp == 'no'}
p friends.group_by {|name| name.length}.sort.to_h
p friends.grep(/L/)
p friends.kind_of? Array