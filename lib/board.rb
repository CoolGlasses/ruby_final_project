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
    attr_accessor :board
    
    def initialize
        @board = build_board()
    end

    def build_board
        finally = Array.new(9) { Array.new(9, " ")}
        
        finally[0] = [" ", "a", "b", "c", "d", "e", "f", "g", "h"]
        
        8.downto(1).each do |row|
            finally[row][0] = row.to_s
        end
    end

    def place_pieces(set)

        end
    end
end