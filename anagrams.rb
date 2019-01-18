require 'byebug'

def anagrams_1(string1, string2)
    permutations = []
    char_array = string1.chars
    char_length = char_array.length
    count = 0
    while permutations.length < char_length.downto(1).inject(:*)
        shuffled_chars = char_array.shuffle
        count += 1
        # p shuffled_chars
        unless permutations.include?(shuffled_chars.join(""))
            permutations << shuffled_chars.join("")
            # p permutations
        end
    end
    p count
    return true if permutations.include?(string2)
    false
end

# Time Complexity = O(inf * n!)

def anagrams_2(string1, string2)
    string1_chars = string1.chars
    string2_chars = string2.chars
    string1_chars.each do |char|
        # debugger
        char_index = string2_chars.index(char)
        unless char_index.nil?
            string2_chars.delete_at(char_index)
        end
    end
    string2_chars.length.zero? ? true : false
end

# Time Complexity = O(n^2)
# Space Complexity = O(n)

def anagrams_3(string1 , string2)
    return true if string1.chars.sort == string2.chars.sort
end

# Time Complexity = O(n log(n))
# Space Complexity = O(n)

def anagrams_4(string1,string2)
    counter_hash = Hash.new(0)
    string1.chars.each do |char|
        counter_hash[char] += 1
    end

    string2.chars.each do |char|
        counter_hash[char] -= 1
    end

    return true if counter_hash.values.all?{|val| val == 0 }
    false
end

