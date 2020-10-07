def substrings(str, dict)
    downed = str.downcase
    list = {}
    dict.each do |word|
        if downed.include?(word)
            fresh = downed.split(word)
            list[word] = fresh.count-1
        end
    end
    return list
end

dictionary = ["below","down","go","going","horn","how",
    "howdy","it","i","low","own","part","partner","sit"]
p substrings("Howdy partner, sit down! How's it going?", dictionary)