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
    attr_accessor :board, :white_set, :black_set
    
    def initialize
        @board = build_board()
        @white_set = ChessSet.new("white")
        @black_set = ChessSet.new("black")
        place_pieces(@white_set)
        place_pieces(@black_set)
    end

    def build_board
        finally = Array.new(9) { Array.new(9, " ")}
        
        finally[0] = [" ", "a", "b", "c", "d", "e", "f", "g", "h"]
        
        8.downto(1).each do |row|
            finally[row][0] = row.to_s
        end

    end

    def place_pieces(set)
        set.pieces.each do |piece|
            location = piece.location.split("")
            col = 0
            case location[0]
                when "a"
                    col = 0
                when "b"
                    col = 1
                when "c"
                    col = 2
                when "d"
                    col = 3
                when "e"
                    col = 4
                when "f"
                    col = 5
                when "g"
                    col = 6
                when "h"
                    col = 7
            end 
            @board[location[1]][col] = piece
        end
    end


end