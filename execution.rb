require "byebug"

def my_min_phase1(list)
    # debugger
    list.each_with_index do |el1, index1|               #O(n)
        list.each_with_index do |el2, index2|           #O(n) == O(n^2)
            if el1 > el2                                #O(1)
                break
            elsif el1 < el2 && index2 == list.length-1  #O(1)
                return el1
            end 
        end
    end
end

# Time Complexity = O(n^2)
# Space Complexity = O(1)

def my_min_phase2(list)
    min = list.first                                    
    list.each do |el1|                                  #O(n)
        if el1 < min
            min = el1
        end
    end
    min
end

# Time Complexity = O(n)
# Space Complexity = O(1)

def largest_contiguous_subsum(list)
    sub_arrays = []
    (0...list.length).each do |i|                       #O(n)
        (i...list.length).each do |j|                   #O(n) -  #O(n^2)
            sub_arrays << list[i..j]
        end
    end
    max = sub_arrays[0].inject(:+)
    sub_arrays.each_index do |idx|
        if max <  sub_arrays[idx].inject(:+)
            max =  sub_arrays[idx].inject(:+)
        end
    end
    return max
end


# Time Complexity = O(n^2)
# Space Complexity = O(n^2)

def largest_contiguous_subsum_phase2(list)
    max = list.inject(:+)
    list.length.times do
        # debugger
        break if list.length < 2
        left_sum = list[0...list.length-1].inject(:+)
        right_sum = list[1...list.length].inject(:+) 
        max = left_sum if max < left_sum
        max = right_sum if max < right_sum
        if left_sum > right_sum
            list.pop
        else
            list.shift
        end
    end
    max
end
# load "execution.rb"
# largest_contiguous_subsum_phase2([2, 3, -6, 7, -6, 7])
# Time Complexity = O(n)
# Space Complexity = O(1)