require "byebug"

require_relative "bishop"
require_relative "board"
require_relative "castle"
require_relative "chessSet"
require_relative "king"
require_relative "knight"
require_relative "pawn"
require_relative "player"
require_relative "queen"

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
        the_board.each_with_index do |row, i|
            puts
            row.each_with_index do |space, k|
                if space == " " || i == 0 || k == 0
                    print space
                else
                    print space.unicode.encode('utf-8')
                end
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
            print_the_board(@board)
            puts
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
                puts
                p "Check!"
                puts
            end

        end
        game_over(@board)
    end

    def get_move(player) 
        player_name = player.name
        p "Remember!  Type the starting coordinate first(Origin - RowColumn), then the finishing coordinate(Destination - RowColumn).  (i.e. 1b, 3c)"
        p "Origin: "
        origin = gets.chomp
        p "Destination: "
        destination = gets.chomp

        finally = [origin, destination]
        return finally
    end

    def valid_move_check(move, player, board)
        origin = location_converter(move[0])
        destination = location_converter(move[1])
        piece = board.board[origin[0].to_i][origin[1].to_i]
        if !check_if_piece_can_move_there(piece, destination)
            return false
        end

        proposed_board = move_piece(origin, destination, board)
        proposed_board.acquire_valid_moves()

        if board.check == true && proposed_board.check == true && board.player_in_check == proposed_board.player_in_check
            p "You would still be in check!"
            return false
        end
        
        if checkmate_check(proposed_board) == true
            proposed_board.checkmate = true
            @board = proposed_board
            @game_over = true
            return true
        else
            @board = proposed_board
            return true
        end
    end

    def location_converter(move)
        finally = ""

        first = move[0]
        last = move[1]

        case last
            when "a"
                last = 1
            when "b"
                last = 2
            when "c"
                last = 3
            when "d"
                last = 4
            when "e"
                last = 5
            when "f"
                last = 6
            when "g"
                last = 7
            when "h"
                last = 8
        end

        finally << [first, last].join("")

        return finally
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
        this_row = origin[0].to_i
        this_col = origin[1].to_i
        piece_to_move = new_board.board[this_row][this_col]
        new_row = destination[0].to_i
        new_col = destination[1].to_i
        new_board.board[new_row][new_col] = piece_to_move
        new_board.board[this_row][this_col] = " "
        new_board.check_check()
        return new_board
    end

    def checkmate_check(board)
        board.valid_moves.each do |move|
            proposed_board = move_piece(move[0], move[1], board)
            if proposed_board.player_in_check != board.player_in_check || proposed_board.player_in_check == nil
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