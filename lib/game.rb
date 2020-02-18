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
    attr_accessor :board, :move_history, :turn
    attr_reader :this_game_number

    def initialize
        @player1 = Player.new
        @player2 = Player.new(@player1.color)
        @board = Board.new
        @game_over = false
        @move_history = []
        @turn = nil
        @this_game_number = rand 100000
    end

    def save
        save = save_hash(@player1, @player2, @board, @move_history, @turn, @this_game_number)
        File.open("saved_game_#{@this_game_number}.txt", "w") do |file|
            file.write save.to_json
        end
    end

    def save_hash(player1, player2, board, move_history, turn, this_game_number)
        save_hash = Hash.new
        save_hash[:player1] = player1
        save_hash[:player2] = player2
        save_hash[:board] = board
        save_hash[:move_history] = move_history
        save_hash[:turn] = turn
        save_hash[:this_game_number] = this_game_number
        return save_hash
    end

    def load_game(game_number)
        load_hash = Hash.new

        load_hash = JSON.parse(File.read("saved_game_#{game_number}.txt"))

        load_hash.each do |k, v|
            case k
                when "player1"
                    @player1 = v
                when "player2"
                    @player2 = v
                when "move_history"
                    @move_history = v
                when "turn"
                    @turn = v
                when "board"
                    @board = v
                else
                    puts "There was an error loading your file! Closing game!"
            end
        end 
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

    def play
        while !@game_over
            if @turn == nil
                if @player1.color == "white"
                    @turn = @player1
                else
                    @turn = @player2
                end
            end

            player_name = @turn.name
            puts
            print_the_board(@board)
            puts
            p "Okay #{player_name}, you're up!"
            puts

            @board.acquire_valid_moves()
            prune_valid_moves(@board, @turn)

            move = get_move(@turn)

            origin = location_converter(move[0])
            destination = location_converter(move[1])

            if !@board.valid_moves.include?([origin, destination])
            # if valid_move_check(move, @turn, @board) == false
                puts
                p "That is not a valid move.  Please try again."
                puts
            else
                @board = move_piece(origin, destination, @board)
                @move_history << [origin, destination]
            end

            @board.check_check()

            if checkmate_check() == true
                @board.checkmate = true
                @game_over = true
            elsif @board.check == true
                puts
                puts "Check!"
                puts
            end

            if @game_over == false
                if @turn == @player1
                    @turn = @player2
                else
                    @turn = @player1
                end
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

    # def valid_move_check(move, player, board)
    #     origin = location_converter(move[0])
    #     destination = location_converter(move[1])
    #     piece = board.board[origin[0].to_i][origin[1].to_i]
    #     if !check_if_piece_can_move_there(piece, destination)
    #         return false
    #     end

    #     proposed_board = temp_board(@move_history)
    #     proposed_board = move_piece(origin, destination, proposed_board)

    #     if board.check == true && proposed_board.check == true && board.player_in_check == proposed_board.player_in_check
    #         p "You would still be in check!"
    #         return false
    #     end

    #     @move_history << [origin, destination]
    #     @board = move_piece(origin, destination, @board)

    #     if checkmate_check() == true
    #         @board.checkmate = true
    #         @game_over = true
    #         return true
    #     else
    #         return true
    #     end
    # end

    def place_pieces(proposed_board, move_history)      
            move_history.each do |move_pair|
                origin = move_pair[0]
                destination = move_pair[1]
                proposed_board = move_piece(origin, destination, proposed_board)
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
        piece_to_move.location = [new_row, new_col]
        new_board.board[this_row][this_col] = " "
        new_board.acquire_valid_moves()
        return new_board
    end

    def temp_board(move_history)
        board_to_create = Board.new

        if !move_history.empty? 
            place_pieces(board_to_create, move_history)
            board_to_create.acquire_valid_moves()
        end
        
        return board_to_create
    end

    def prune_valid_moves(board, turn)
        finally = []
        board.valid_moves.each do |move|
            temp_board = temp_board(@move_history)
            piece_to_move = temp_board.board[move[0][0].to_i][move[0][1].to_i]
            if piece_to_move.color == turn.color
                temp_board = move_piece(move[0], move[1], temp_board)
                temp_board.check_check()
                correct_color = true
            else
                correct_color = false
            end

            if correct_color == true
                if temp_board.check == false
                    finally << move
                elsif temp_board.player_in_check != turn.color
                    finally << move
                end
            end
        end

        board.valid_moves = finally
    end

    def checkmate_check
        if @turn == @player1
            player_to_check = @player2
        else
            player_to_check = @player1
        end

        board_to_check = temp_board(@move_history)
        prune_valid_moves(board_to_check, player_to_check)

        if board_to_check.valid_moves.empty?
            return true
        else
            return false
        end
    end

    def game_over(board)
        if board.player_in_check == "black"
            p "Gameover! White player wins!"
        else
            p "Gameover! Black player wins!"
        end

    end

end