hash1 = {'mon' => 'pts', 'tue' => 'sal', 'wed' => 'car'}
hash2 = Hash.new
hash2 = {1 => 'one', 2 => 'two'}
puts hash1['mon']
puts hash2.fetch(1)
puts hash2.fetch(3,'Not found') # if 3 is not found
hash2[3] = 'three'
puts hash2.to_s
hash2.delete(2)
meth = hash1.methods
puts meth[0..2].to_s
def s(hasho)
    return hasho.to_s
end
puts s(hash2.keys)
puts hash1.merge(hash2)
hash3 = {me: 'tmr', you: 'pln', us: 'dgn'}
puts hash3[:us]
hash3.each {|key,val| puts "The #{key} is entangled with #{val}"}
hash4 = {day: 6, month: 'Oct', year: 2020}
def release(name, date={})
    if date.empty?
        puts "Mijn naam is #{name}"
    else
        puts "#{name} wrote this on #{date[:day]}-#{date[:month]}-#{date[:year]}"
    end
end
release('Tmr',hash4)
puts hash4.has_key?(:day)
puts hash4.select {|key,val| key == :year}
puts s(hash4.to_a)
puts '---------------------'
hash4.each {|k,v| print k}
hash4.each {|k,v| print v}
hash4.each {|e| print e}
puts '---------------------'
hash4.include?('Oct')
puts '---------------------+'