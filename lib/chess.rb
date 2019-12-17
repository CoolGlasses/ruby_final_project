require "byebug"

class Board #8x8 playing surface, 9x9 if you include Row & Column Labels
    attr_accessor :board, :white_set, :black_set
    
    def initialize
        @board = build_board()
        @white_set = ChessSet.new("white", @board)
        @black_set = ChessSet.new("black", board)
    end

    def build_board
        finally = Array.new(9) { Array.new(9, " ")}
        
        finally[0] = [" ", "a", "b", "c", "d", "e", "f", "g", "h"]
        
        8.downto(1).each do |row|
            finally[row][0] = row.to_s
        end

    end

end

class ChessSet
    attr_reader :color
    attr_accessor :pieces

    def initialize(color)
        @color = color
        @pieces = get_pieces(@color) ##an array of piece instances
    end

    def get_pieces(color)
        finally = []

        (1..8).each do |num|
            finally << Pawn.new(num, color)
        end

        (1..2).each do |num|
            finally << Castle.new(num, color)
        end

        (1..2).each do |num|
            finally << Knight.new(num, color)
        end

        (1..2).each do |num|
            finally << Rook.new(num, color)
        end

        finally << Queen.new(color)
        finally << King.new(color)

        return finally
    end
end

class Pawn
    attr_reader :num, :color
    attr_accessor :status, :location
    def initialize(num, color)
        @num = num
        @color = color
        @status = "free"
        @location = nil
    end
end

class Knight
    attr_reader :num, :color
    attr_accessor :status, :location
    def initialize(num, color)
        @num = num
        @color = color
        @status = "free"
        @location = nil
    end
end

class Castle
    attr_reader :num, :color
    attr_accessor :status, :location
    def initialize(num, color)
        @num = num
        @color = color
        @status = "free"
        @location = nil
    end
end

class Bishop
    attr_reader :num, :color
    attr_accessor :status, :location
    def initialize(num, color)
        @num = num
        @color = color
        @status = "free"
        @location = nil
    end
end

class King
    attr_reader :num, :color
    attr_accessor :status, :location
    def initialize(num, color)
        @num = num
        @color = color
        @status = "free"
        @location = place_king(@color)

    end

    def place_king(color)
        if color == "white"
            return "e1"
        else
            return "e8"
        end
    end

end

class Queen
    attr_reader :num, :color
    attr_accessor :status, :location
    def initialize(num, color)
        @num = num
        @color = color
        @status = "free"
        @location = nil
    end
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

    def get_move(player)
        p "#{player}, it's your turn.  What would you like to do?"
        p "Remember!  Type the starting coordinate first(Origin), then the finishing coordinate(Destination).  (i.e. b1, c3)"
        p "Origin: "
        origin = gets.chomp
        p "Destination: "
        destination = gets.chomp

        finally = [origin, destination]
        return finally
    end



end