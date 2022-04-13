require "byebug"
class Array
# Array#deep_dup

    def deep_dup(level = 0)
        return self.dup if self.empty?
        debugger
        self.each do |el|
            if el.is_a?(Array)
                debugger
                result = self.deep_dup(level += 1)
            else
                result << el
            end
        end
        debugger
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