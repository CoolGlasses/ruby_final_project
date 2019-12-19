require "byebug"
require "bishop.rb"
require "board.rb"
require "castle.rb"
require "chess.rb"
require "chessSet.rb"
require "king.rb"
require "knight.rb"
require "pawn.rb"
require "player.rb"
require "queen.rb"

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

    def check_check(player)
    end

    def checkmate_check(player)
    end

    def save
    end

    def move_piece(origin, destination)
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