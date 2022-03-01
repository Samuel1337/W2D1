# Define your methods here.

def my_map!(array, &prc)
    array = array.each_with_index { |el, i| array[i] = prc.call(el) } 
    array
end

def two?(array, &prc)
    array.count { |el| prc.call(el) } == 2
end

def nor_select(array, prc1, prc2)
    array.select { |el| !prc1.call(el) && !prc2.call(el) }
end

def array_of_hash_sum(array)
    sum = 0
    array.each { |hash| hash.each { |key, val| sum+= val  } }
    sum
end

def slangify(string)
    string.split(" ").map do |word|
        i = 0
        while i < word.length do
            if "aeiou".include?(word[i])
                word = word[0...i] + word[i+1..-1]
                break
            end
            i+=1
        end
        word
    end.join(" ")

end

def char_counter(string, *chars)
    hash = {}
    # chars.each { |char| hash[char] = 0 } if chars.length > 0
    string.each_char do |char|
        hash[char] = 0 if hash[char] == nil    
        hash[char] += 1 
    end
    hash.select {|k,v| chars.include?(k) && chars.length > 0} 
end

