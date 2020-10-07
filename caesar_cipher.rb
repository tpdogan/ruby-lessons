def caesar_cipher(str)
    plain = str.split('')
    ciphered = ''
    aBC = ('V'..'Z').to_a + ('A'..'Z').to_a + ('A'..'E').to_a
    abc = ('v'..'z').to_a + ('a'..'z').to_a + ('a'..'e').to_a
    plain.each do |ch|
        if abc.include?(ch)
            loc = abc.index(ch)
            ciphered += abc[loc+5]
        elsif aBC.include?(ch)
            loc = aBC.index(ch)
            ciphered += aBC[loc+5]
        else
            ciphered += ch
        end
    end
    return ciphered
end
puts caesar_cipher('What a string!')