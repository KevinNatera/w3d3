require "byebug"

# class Array

#     def deep_dup(level = 0)
#         return self.dup if self.length <= 1

#         final_arr = []

#         self.each do |el|
#             if el.is_a?(Array)
#                 final_arr << el.deep_dup
#             else
#                 final_arr << el
#             end
#         end
#         final_arr
#     end

# end


# robot_parts = [
#     ["nuts", "bolts", "washers"],
#     ["capacitors", "resistors", "inductors"]
#   ]
  
# robot_parts_copy = robot_parts.deep_dup
  

# robot_parts_copy[0] << "LEDs"

# puts "copy #{robot_parts_copy[0]}"
# p robot_parts[0] # => ["capacitors", "resistors", "inductors", "LEDs"]

# #Integer#fibonacci

# def fibonacci(n) # 3
#     return [] if n == 0
#     return [1] if n == 1
#     return [1, 1] if n == 2

#     result = fibonacci(n - 1)

#     sum = result[-1] + result[-2]

#     result << sum
# end



def bsearch(array,target)
    return nil if array.empty?

    arr = array.sort
    mid = array.length / 2
    
    debugger
    case target <=> arr[mid]
    when -1
        bsearch(arr.take(mid),target)
    when 0
        return mid 
    when 1 
       result = bsearch(arr.drop(mid + 1),target)
       result.nil? ?  nil :  (mid + 1) + result 
    end
end

def merge_sort(array)
    return array.dup if array.length <= 1

    mid = array.length / 2
    left_side = array.take(mid)
    right_side = array.drop(mid)

    left_sorted = merge_sort(left_side)
    right_sorted = merge_sort(right_side)

    merge(left_sorted, right_sorted)
end

def merge(left, right)
    merged = []
    until left.empty? || right.empty?
        case left.first <=> right.first
        when -1
            merged << left.shift
        when 0
            merged << right.shift
        when 1
            merged << right.shift
        end
    end
    merged + left + right
end

# p merge_sort([43,26,72,6,9,3,1,1,6])
# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil



def subsets(array)
    return [[]] if array.empty? 

    result = subsets(array[0...-1])    
    result + result.map {|ele| ele + [array.last] }
end


p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3])  # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]




