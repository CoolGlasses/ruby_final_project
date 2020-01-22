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
    attr_accessor :board

    def initialize
        @player1 = Player.new
        @player2 = Player.new(@player1.color)
        @board = Board.new
        @game_over = false
    end

    def save
    end

    def print_the_board(board)
        the_board = board.board
        the_board.each do |row|
            row.each do |space|
                print space.encode('utf-8')
            end
        end
    end

    def play(turn=nil)
        while !@game_over
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
            if valid_move_check(move, turn, @board) == false
                p "That is not a valid move.  Please try again."
            elsif @game_over == false
                if turn == @player1
                    turn = @player2
                else
                    turn = @player1
                end
            end

            if @board.check == true
                p "Check!"
            end

        end
        game_over(@board)
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

    def valid_move_check(move, player, board)
        piece = move[0]
        if !check_if_piece_can_move_there(piece, move[1])
            return false
        end

        proposed_board = move_piece(move[0], move[1], board)
        proposed_board = proposed_board.acquire_valid_moves

        if checkmate_check(proposed_board) == true
            proposed_board.checkmate = true
            @board = proposed_board
            @game_over = true
            return true
        elsif board.check == true && proposed_board.check == true
            p "Still in check!"
            return false
        else
            @board = proposed_board
            @board.check_check()
            return true
        end
    end

    def check_if_piece_can_move_there(piece, move)
        if piece.valid_moves.include?(move)
            return true
        else
            return false
        end
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

    def checkmate_check(board)
        board.valid_moves.each do |move|
            proposed_board = move_piece(move[0], move[1], board)
            proposed_board = proposed_board.acquire_valid_moves
            if proposed_board.black_check == false || proposed_board.white_check == false
                return false
            end
        end

        return true
    end

    def game_over(board)
        if board.player_in_check == "black"
            p "Gameover! White player wins!"
        else
            p "Gameover! Black player wins!"
        end

    end

end