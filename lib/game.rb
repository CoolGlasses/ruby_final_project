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
    attr_accessor :board, :white_set, :black_set

    def initialize
        @player1 = Player.new
        @player2 = Player.new(@player1.color)
        @board = Board.new
        @white_set = ChessSet.new("white")
        @black_set = ChessSet.new("black")
        @board.place_pieces(@white_set)
        @board.place_pieces(@black_set)
    end

    def get_move(player) ##is Row, Column the correct format for cell identification?
        player_name = player.name
        p "#{player.name}, it's your turn.  What would you like to do?"
        p "Remember!  Type the starting coordinate first(Origin - RowColumn), then the finishing coordinate(Destination - RowColumn).  (i.e. 1b, 3c)"
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
        if player.in_check == true
            return true
        end

        return false
    end

    def checkmate_check(player)
        if player.checkmate == true
            return true
        end

        return false
    end

    def save
    end

    def move_piece(origin, destination)
        board = @board.board
        this_row = origin[0]
        this_col = origin[1]
        piece_to_move = board[this_row][this_col]

        if piece_to_move.valid_moves.include?(destination)
            new_row = destination[0]
            new_col = destination[1]
            board[new_row][new_col] = piece_to_move
            board[this_row][this_col] = " "
        else
            p "invalid move"
        end
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
            move_piece(move[0], move[1])
            

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