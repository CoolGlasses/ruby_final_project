require "byebug"

class Board #8x8 playing surface, 9x9 if you include Row & Column Labels
    attr_accessor :board, :valid_moves, :check, :checkmate, :player_in_check, :white_set, :black_set
    
    def initialize
        @board = build_board()
        @check = false
        @checkmate = false
        @player_in_check = nil
        @white_set = ChessSet.new("white")
        @black_set = ChessSet.new("black")
        place_pieces(@white_set.pieces)
        place_pieces(@black_set.pieces)
        trigger_valid_moves_functions()
        @valid_moves = acquire_valid_moves()
    end

    def build_board
        finally = Array.new(9) { Array.new(9, " ")}
        
        finally[0] = [" ", "a", "b", "c", "d", "e", "f", "g", "h"]
        
        8.downto(1).each do |row|
            finally[row][0] = row.to_s
        end
        return finally
    end

    def place_pieces(set)
        set.each do |piece|
            location = piece.location
            @board[location[0]][location[1]] = piece
        end
    end

    def trigger_valid_moves_functions
        i = 1
        while i < 9
            k = 1
            while k < 9
                if @board[i][k] != " "
                    @board[i][k].next_valid_moves(@board)
                end
                k += 1
            end
            i += 1
        end
    end


    def acquire_valid_moves
        finally = []

        i = 1
        while i < 9
            k = 1
            while k < 9
                if @board[i][k] != " "
                    piece = @board[i][k]
                    piece.valid_moves.each do |move|
                        finally << [piece.location.join(""), move] if !move.nil?
                    end
                end
            k += 1
            end
        i += 1
        end
        @valid_moves = finally
    end

    def check_check
        destinations = []
        byebug
        @valid_moves.each do |subArray|
            destinations << subArray[1]
        end

        if white_check(destinations) == true
            @check = true
            @player_in_check = "white"
        elsif black_check(destinations) == true
            @check = true
            @player_in_check = "black"
        else
            @check = false
            @player_in_check = nil
        end
    end

    def black_check(destinations)
        black_king = @black_set.pieces[-1]

        if destinations.include?(black_king.location)
            @check = true
            @player_in_check = "black"
            return true
        else
            return false
        end 
    end

    def white_check(destinations)
        white_king = @white_set.pieces[-1]

        if destinations.include?(white_king.location)
            @check = true
            @player_in_check = "white"
            return true
        else
            return false
        end
    end
end