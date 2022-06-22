class Board #this is a Board Class/BluePrint. It is used to instantiate a new Instance of Board. 
    attr_reader :size
    def initialize(n) #when you instantiate a Board, you just need to do Board1 = Board.new(2) <-- and given this info, it will instantiate a new Board instance that will contain all these attributes
        @n = n
        @grid = Array.new(n) {Array.new(n,:N)} #2d array with n rows and n columns
        @size = n*n
    end

    def [](position) #position = an arr containing coordinates that represent location of the grid 
        #eg. position = [1,2] <-- i need to figure out how to make @grid[1][2]
        @grid[position[0]][position[-1]] #gives you the value at the current position, which right now is just :N
    end

    def []=(position,val) 
        @grid[position[0]][position[-1]] = val #change the current position :N to the set value, which is :S
        # self.[](position) = val #does not work because you cannot call a method with the same name and set it as equal. eternal loop
    end

    def num_ships
        count = 0
        @grid.each do |subArray|
            subArray.each do |ele|
                if ele == :S
                    count+=1
                end
            end
        end
        count
    end

    def attack(position)
        if self[position] == :S #check for equivalence
            self[position] = :H #reassigning 
            p "you sunk my battleship!"
            return true
        else
            self[position] = :X
            return false
        end
    end
  
    def place_random_ships
        total_ship = @size*(0.25) #total ship on board beginning of game. decimal round down
        while self.num_ships < total_ship #0<9
            row = rand(0...@grid.length)
            column = rand(0...@grid.length)
            position = [row,column]
            self[position] = :S    
        end
    end

    def hidden_ships_grid
        new_arr = Array.new(@n) {Array.new(@n,:N)} 
        @grid.each_with_index do |subArray,row|
            subArray.each_with_index do |ele,column|
                if ele == :S
                    new_arr[row][column] = :N
                else
                    new_arr[row][column] = ele
                end
            end
        end
        new_arr
        # @grid.map do |subArray|
        #     subArray.map do |ele|
        #         if ele == :S
        #             :N
        #         else
        #             ele
        #         end
        #     end
        # end
    end

    def self.print_grid(grid) #grid is a 2d array of a grid & this is a class method
        grid.each do |subArray|
            puts subArray.join(" ") #<-- join the elements of the subArray together and add a space in between
        end
    end

    def cheat #instance method
        Board.print_grid(@grid) #cannot use .self to refer to the board class because you are now in the instance method, not a class method
    end                      #this means that in order to call the Board Class, you have to treat the board class as an instance, which
                             #means you have to use its name. 
    def print
        Board.print_grid(self.hidden_ships_grid) #print is an instance method, and since print_grid is a class method, you can only call it using Board class
    end                                         #but you cannot use .self because you are in an instance method, so the Board class is just a Board instance in this case.
                           #in order to pass in the hidden_ships_grid method, which is an instance method, you can only call it using instance.
                          #because you are calling it in an instance class, ruby will know that .self is referring to the object
    
end

