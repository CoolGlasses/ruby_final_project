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

    def get_move(player) 
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

    def valid_move_check(move, player, board_array)
        if player.color == "white"
            set = @white_set
        else
            set = @black_set
        end

        piece = move[0]
        if !check_if_piece_can_move_there(piece, move[1])
            return false
        end

        proposed_board = move_piece(move[0], move[1], board_array)
        proposed_board = proposed_board.acquire_valid_moves

        




    end

    def check_if_piece_can_move_there(piece, move)
        if piece.valid_moves.include(move)
            return true
        else
            return false
        end
    end



    def location_converter(coordinates)
    end

    def black_check
        black_king = @black_set.pieces[-1]
        white_moves = @white_set.valid_moves

        if white_moves.include(black_king.location)
            return true
        else
            return false
        end 
    end

    def white_check
        white_king = @white_set.pieces[-1]
        black_moves = @black_set.valid_moves

        if black_moves.include(white_king.location)
            return true
        else
            return false
        end
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

    def move_piece(origin, destination, board)
        new_board = board
        this_row = origin[0]
        this_col = origin[1]
        piece_to_move = new_board[this_row][this_col]
        new_row = destination[0]
        new_col = destination[1]
        new_board[new_row][new_col] = piece_to_move
        new_board[this_row][this_col] = " "

        return new_board
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
                if checkmate_check(@player2) == true
                    p "Checkmate! #{player_name} wins!"
                    game_over = true
                elsif check_check(@player2) == true
                    p "Check!"
                    turn = @player2
                else
                    turn = @player2
                end
            else
                if checkmate_check(@player1) == true
                    p "Checkmate! #{player_name} wins!"
                    game_over = true
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