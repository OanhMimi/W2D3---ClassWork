#The Board class is responsible for adding a player's marks, 
#checking for winners, and printing the game board.
# A board instance must have an attribute to represent the grid. 
#For simplicity, give the grid the dimensions of classic tic-tac-toe, 3x3.


class Board

    def self.grid_default
        Array.new(3) {Array.new(3,"_")}
    end
    def initialize #does not accept any arguments because we want to default it to 3x3 grid
        @grid = Board.grid_default
    end

    #return a boolean indicating whether or not the specified position is valid
    #for the board, meaning the position is not "out of bounds"
    def valid?(position) #position is an array [row,col]
        row, col = position 
        if (row >=0 || row < @grid.length) && (col >= 0 || col < @grid.length) 
            true
        else
            false
        end

    end

    #return a boolean indicating whether or not the specified position
    #does not contain a player's mark
    def empty?(position)
        row, col = position
        if @grid[row][col] == "_"
            true
        else
            false
        end

    end

    #assign the gien mark to the specified location of the grid
    #raises an error when the position is not valid? or not empty?
    def place_mark(position,mark)
        row, col = position
        if self.valid?(position) && self.empty?(position)
            @grid[row][col] = mark
        else
            raise "Not valid!"
        end
    end

    def print
        puts
        puts
        @grid.each_with_index do |subarr, i|
            if i == (subarr.length - 1)
                n_sub = subarr.map do |ele|
                    if ele == '_'
                        ele = ' '
                    else
                        ele
                    end
                end
                puts ' ' + n_sub.join(' | ') + ' ' #subarr[2]
            else
                puts '_' + subarr.join('_|_') + '_' #subarr[0 and 1]
            end
        end
        puts
        puts
    end

    #return a boolean indicating whether or not the given mark has 
    #completely filled up any row of the grid
    def win_row?(mark)
        count = 0
        (0...@grid.length).each do |idx1|
            count = 0
            (0...@grid.length).each do |idx2|
                if @grid[idx1][idx2] == mark
                    count+=1
                end
            end
            if count == 3
                return true
            end
        end
        false
        # @grid.any? {|row| row.unique == mark}
        #     return true
        # end
        # false
    end

    def win_col?(mark)
        count = 0
        (0...@grid.length).each do |idx1|
            count = 0
            (0...@grid.length).each do |idx2|
                if @grid[idx2][idx1] == mark
                    count+=1
                end
            end
            if count == 3
                return true
            end
        end
        false
    end

    def win_diagonal?(mark)
        count = 0
        (0...@grid.length).each do |i|
            if @grid[i][i]== mark
                count+=1
            end
        end
        if count == 3
            return true
        end
        count = 0
        (0...@grid.length).each do |i|
            if @grid[i][@grid.length-i-1] == mark
                count+=1
            end
        end
        if count == 3
            return true
        end
        false
    end

    #return a boolean indicating whether or not the given mark has filled any full row, col, or diag
    def win?(mark)
        if win_row?(mark) || win_diagonal?(mark) || win_col?(mark)
            true
        else
            false
        end
    end

    def empty_positions?
        @grid.each do |subArray|
            subArray.each do |ele|
                if ele == "_"
                    return true
                end
            end
        end
        false
    end
end

# p b = Board.new 
# b.place_mark([0, 0], :X)
# b.place_mark([1, 0], :X)
# b.place_mark([2, 0], :X)

# b.print
# p b.win?(:X)