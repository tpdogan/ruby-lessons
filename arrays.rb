arr1 = [1,2,3,4]
arr2 = ['a','b','c']
puts arr1.join('|')
puts arr2.join('|')
arr3 = ['q',"NAME",356]
puts arr3.join('|')
arr4 = Array.new
arr5 = Array.new(3)
arr6 = Array.new(3, "Hoi")
arr7 = Array.new(3, Array.new)
puts '-------------------'
puts arr3[2]
puts arr2[-1]
arr8 = [146,18,418641,185,813651,48,8168,38]
puts arr8.first(2).join('|')
puts arr8.last(2).join('|')
puts arr8[0..3].join('|')
arr8.push(9,99,999)
arr8.pop(2)
puts arr8.join('|')
puts '-------------------'
arr8 << 999
puts arr8.join('|')
arr8.unshift(2)
puts arr8.join('|')
arr8.shift(5)
puts arr8.join('|')
arr9 = arr1 + arr2
puts arr9.join('|')
arr10 = arr2.concat(arr3)
puts '-------------------'
puts arr10.join('|')
arr11 = [1,1,1,4,44,41,14]
arr12 = arr11 - arr1
puts arr12.join('|')
arr13 = arr1.methods
puts arr13[0..10].join('|')
puts arr13.length
puts arr4.empty?
puts arr7.empty?
puts '-------------------'
puts arr1.reverse.join('|')
puts arr1.include?(3)
puts arr1.include?('3')
arr14 = arr1.map {|elem| elem**2}
puts arr14.join('|')
arr14.delete_at(2)
puts arr14.join('|')
arr11.delete(1)
puts arr11.join('|')
puts '-------------------'
arr15 = [1,1,2,2,2,3,4,4,5,5,5,5,5,5,5,5,5,5]
puts arr15.uniq.join('|')
puts arr15.join('|')
puts arr15.uniq!.join('|')
puts arr15.select {|elem| elem>2.5}.join('|')
def mutateForSure(arr, methode)
    return arrM = arr.send(methode)
end
puts mutateForSure(arr15,'uniq').join('|')
puts '-------------------'
puts arr1 == arr2
puts arr15.to_s
def j(arr)
    return arr.join('|')
end
arr16 = [1,2,[3,4],5]
puts arr16.to_s
puts arr16 == arr15
puts arr16.flatten!.to_s
puts '-------------------'
puts arr16 == arr15
arr2.each_index {|i| puts "The value at #{i} is #{arr2[i]}"}
arr12.each_with_index {|val,idx| puts "#{val} is at #{idx}"}
puts j(arr12.sort)
def s(arr)
    return arr.to_s
end
puts s(arr12.product([nil]))
arr17 = [[1,2],[3,4,5],[6]]
puts '-------------------'
puts s(arr17)
puts arr17[1][0]
puts s(arr17[1].index(4))
arr18 = arr12.map {|elem| elem+2}
p arr12
p arr18
arr19 = %w(ana baci gardas)
puts j(arr19)
p arr19
puts '-------------------'
puts arr19.size == arr19.length
arr20 = "q,w,e,r"
puts j(arr20.split(','))
puts arr19.sample
p [true, nil, false].compact
puts j(arr1 & arr16)
puts arr16.fetch(3)
puts j(arr12.take(2))
puts j(arr2.drop(3))
puts '-------------------'
puts j(arr19.insert(1,'baba','dayi'))
arr21 = arr1.reject {|elem| elem < 2}
puts j(arr21)
