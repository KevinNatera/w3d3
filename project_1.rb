require "byebug"

class Array

    def deep_dup(level = 0)
        return self.dup if self.length <= 1

        final_arr = []

        self.each do |el|
            if el.is_a?(Array)
                final_arr << el.deep_dup
            else
                final_arr << el
            end
        end
        final_arr
    end

end


robot_parts = [
    ["nuts", "bolts", "washers"],
    ["capacitors", "resistors", "inductors"]
  ]
  
robot_parts_copy = robot_parts.deep_dup
  
# shouldn't modify robot_parts
robot_parts_copy[0] << "LEDs"
# but it does
puts "copy #{robot_parts_copy[0]}"
p robot_parts[0] # => ["capacitors", "resistors", "inductors", "LEDs"]