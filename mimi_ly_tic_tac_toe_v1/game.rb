require_relative "./board.rb"
require_relative "./human_player.rb"

class Game

    def initialize(player_1_mark,player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player_1
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            if @current_player == @player_1
                @board.place_mark(@player_1.get_position,@player_1.mark_value)
                if @board.win?(@player_1.mark_value)
                    p "VICTORY!!!!, #{@player_1.mark_value} won!"
                    return
                else
                    self.switch_turn
                end
            else
                @board.place_mark(@player_2.get_position,@player_2.mark_value)
                if @board.win?(@player_2.mark_value)
                    p "VICTORY!!!!, #{@player_2.mark_value} won!"
                    return
                else
                    self.switch_turn
                end
            end
        end
        p "It's a draw!!!"
    end
end