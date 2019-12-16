require "byebug"

class Board #8x8 playing surface, 9x9 if you include Row & Column Labels
    attr_accessor :board
    
    def initialize
        @board = build_board()
    end

    def build_board
    end
end

class ChessSet
end

class Pawn
end

class Knight
end

class Castle
end

class Rook
end

class King
end

class Queen
end

class Player
    attr_reader :name, :color

    def initialize(color=nil)
        @name = get_player_name()
        @color = get_player_color(color)
    end

    def get_player_name
        puts "Hello, what is your name?"
        name = gets.chomp

        return name
    end

    def get_player_color(color)
        if color == nil
            puts "What color would you like to be?"
            color = gets.chomp
        elsif color.downcase == "black"
            color = "white"
        else
            color = "black"
        end

        return color
    end
end

class Game

    def initialize
        @player1 = Player.new
        @player2 = Player.new(@player1.color)
        @board = Board.new
    end

end