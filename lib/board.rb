require "byebug"
require "bishop.rb"
require "castle.rb"
require "chess.rb"
require "chessSet.rb"
require "game.rb"
require "king.rb"
require "knight.rb"
require "pawn.rb"
require "player.rb"
require "queen.rb"


class Board #8x8 playing surface, 9x9 if you include Row & Column Labels
    attr_accessor :board, :valid_moves, :check, :checkmate, :player_in_check, :white_set, :black_set
    
    def initialize
        @board = build_board()
        @valid_moves = acquire_valid_moves()
        @check = false
        @checkmate = false
        @player_in_check = nil
        @white_set = ChessSet.new("white")
        @black_set = ChessSet.new("black")
        @board.place_pieces(@white_set)
        @board.place_pieces(@black_set)
    end

    def build_board
        finally = Array.new(9) { Array.new(9, " ")}
        
        finally[0] = [" ", "a", "b", "c", "d", "e", "f", "g", "h"]
        
        8.downto(1).each do |row|
            finally[row][0] = row.to_s
        end
    end

    def place_pieces(set)
        set.each do |piece|
            @board[piece.location] = piece
        end
    end

    def acquire_valid_moves
        finally = []

        i = 1
        
        while i < 9
            k = 1
            while k < 9
                @board[i][k].valid_moves.each do |move|
                    finally << move
                end
            k += 1
            end
        i += 1
        end
        return finally
    end

    def black_check
        black_king = @black_set.pieces[-1]

        if valid_moves.include(black_king.location)
            @check = true
            @player_in_check = "black"
            return true
        else
            return false
        end 
    end

    def white_check
        white_king = @white_set.pieces[-1]

        if valid_moves.include(white_king.location)
            @check = true
            @player_in_check = "white"
            return true
        else
            return false
        end
    end
end