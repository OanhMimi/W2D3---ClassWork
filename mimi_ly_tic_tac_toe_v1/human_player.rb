#hold informaton about the user & prompting them to enter a position for gameplay
class HumanPlayer

    attr_reader :mark_value
    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        p "Hello Player #{mark_value}, your mark is #{@mark_value}"
        p "Please enter the position as two numbers with a space between them"
        p "For example, you can do '0 0' "
        position = gets.chomp
        if position.split(" ").length == 2 
            new_arr = position.split(" ").map {|num| num.to_i}
            return new_arr
        else
            raise "Invalid Input, please enter the position in the correct format"
        end
    end

end