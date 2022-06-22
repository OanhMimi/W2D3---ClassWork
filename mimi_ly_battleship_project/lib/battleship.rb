require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player
    def initialize(n)
        @n = n #length of board
        @player = Player.new #new player instance/instantiating a new player)
        @board = Board.new(n)
        @remaining_misses = @board.size/2
    end

   def start_game
        @board.place_random_ships
        p @board.num_ships
        p @board.print
   end

   def lose?
        if @remaining_misses <= 0
            p "you lose"
            return true
        else
            return false
        end
   end

   def win?
        if @board.num_ships == 0
            p "you win"
            return true
        else
            return false
        end
   end

   def game_over?
        if self.win? || self.lose?
            return true
        else
            false
        end
   end

   def turn
        move = @player.get_move #get move from player
        if !@board.attack(move)
            @remaining_misses -= 1
            p @remaining_misses
        else
            p @remaining_misses
        end
        @board.print
        
   end

end
