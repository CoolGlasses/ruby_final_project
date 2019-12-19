require "byebug"
require "board.rb"



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
    attr_accessor :status, :valid_moves
    def initialize(num, color)
        @num = num
        @color = color
        @status = "free"
        @location = set_location(@num, @color)
        @valid_moves = []
    end

    def location
        @location
    end

    def location=(board_array, destination_array)
        @location = destination_array.join("")
    end

    def set_location(num, color)
        row = 0
        if color == "black"
            row = 7
        else
            row = 2
        end

        col = 0
        case num
            when 1
                col = "a"
            when 2
                col = "b"
            when 3
                col = "c"
            when 4
                col = "d"
            when 5
                col = "e"
            when 6
                col = "f"
            when 7
                col = "g"
            when 8
                col = "h"
        end
        return "#{col}#{row}"
    end

    def next_valid_moves(board_array)
        finally = []
        location_coordinates = @location.split("")
        this_col = location_coordinates[0]
        this_row = location_coordinates[1]
        
        if @color == "white"
            move_one = this_row + 1
            move_two = this_row + 2
        else
            move_one = this_row - 1
            move_two = this_row - 2
        end
        
        if board_array[this_col][move_one] == " "
            finally << "#{this_col}#{move_one}"
        end

        if board_array[this_col][up_two] == " " && (this_row == 7 || this_row == 2)
            finally << "#{this_col}#{move_two}"
        end

        return finally
    end

end

class Knight
    attr_reader :num, :color
    attr_accessor :status, :location
    def initialize(num, color)
        @num = num
        @color = color
        @status = "free"
        @location = set_location(@num, @color)
    end

    def set_location(num, color)
        row = 0
        if color == "black"
            row = 8
        else
            row = 1
        end

        col = 0
        case num
            when 1
                col = "b"
            when 2
                col = "g"
        end

        return "#{col}#{row}"
    end
end

class Castle
    attr_reader :num, :color
    attr_accessor :status, :location
    def initialize(num, color)
        @num = num
        @color = color
        @status = "free"
        @location = set_location(@num, @color)
    end

    def set_location(num, color)
        row = 0
        if color == "black"
            row = 8
        else
            row = 1
        end

        col = 0
        case num
            when 1
                col = "a"
            when 2
                col = "h"
        end

        return "#{col}#{row}"
    end
end

class Bishop
    attr_reader :num, :color
    attr_accessor :status, :location
    def initialize(num, color)
        @num = num
        @color = color
        @status = "free"
        @location = set_location(@num, @color)
    end

    def set_location(num, color)
        row = 0
        if color == "black"
            row = 8
        else
            row = 1
        end

        col = 0
        case num
            when 1
                col = "c"
            when 2
                col = "f"
        end

        return "#{col}#{row}"
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

    def set_location(color)
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
        @location = place_queen(@color)
    end

    def set_location(color)
        if color == "white"
            return "d1"
        else
            return "d8"
        end
    end
end

class Player
    attr_reader :name, :color
    attr_accessor :in_check, :checkmate

    def initialize(color=nil)
        @name = get_player_name()
        @color = get_player_color(color)
        @in_check = false
        @checkmate = false
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
        player_name = player.name
        p "#{player.name}, it's your turn.  What would you like to do?"
        p "Remember!  Type the starting coordinate first(Origin - ColumnRow), then the finishing coordinate(Destination - ColumnRow).  (i.e. b1, c3)"
        p "Origin: "
        origin = gets.chomp
        p "Destination: "
        destination = gets.chomp

        finally = [origin, destination]
        return finally
    end

    def location_converter(coordinates)
    end

    def play(turn=nil)
        game_over = false
        while !game_over
            if turn == nil
                if @player1.color == "white"
                    turn = @player1
                else
                    turn = @player2
                end
            end

            player_name = turn.name

            p "Okay #{player_name}, you're up!"
            move = get_move(turn)
            origin = location_converter(move[0])
            destination = location_converter(move[1])
            piece_to_move = @board[origin[0]][origin[1]]
            piece_to_move.location = destination

            if turn == @player1
                if check_check(@player2) == true && checkmate_check(@player2) == true
                    p "Checkmate! #{player_name} wins!"
                    turn = @player2
                elsif check_check(@player2) == true
                    p "Check!"
                    turn = @player2
                else
                    turn = @player2
                end
            else
                if check_check(@player1) == true && checkmate_check(@player1) == true
                    p "Checkmate! #{player_name} wins!"
                    turn = @player1
                elsif check_check(@player1) == true
                    p "Check!"
                    turn = @player1
                else
                    turn = @player1
                end
            end
        end
    end
        



end