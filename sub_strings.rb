def substrings(string, dictionary)
    intersection = []
    substrings_hash = {}
    array_from_string = string.downcase.split(" ")
    array_from_string.each do |word|
        dictionary.each do |subs|
            if (word.include?(subs))
                intersection.push(subs)
            end
        end
    end
    substrings_hash = intersection.reduce(Hash.new(0)) do |result, word|
        result[word] += 1
        result
    end
    return substrings_hash
end
