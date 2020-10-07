def stock_picker(prices)
    maxAll = 0
    ret = [0,0]
    prices.each_with_index do |p,i|
        rest = prices[i+1..prices.length]
        gain = rest.map {|q| q-p}
        max = gain.sort[gain.length-1]
        if max > maxAll
            pos = gain.index(max) + i + 1
            ret = [i,pos]
            maxAll = max
        end
        if i == prices.length-2
            return ret
        end
    end
end

numbers = [17,3,6,9,15,8,6,1,10]
numbers2 = [12,17,3,18,32,2,0,30,-3]
p stock_picker(numbers)
p stock_picker(numbers2)