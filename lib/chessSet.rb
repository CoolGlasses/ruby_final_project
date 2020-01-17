require "byebug"
require "bishop.rb"
require "board.rb"
require "castle.rb"
require "chess.rb"
require "game.rb"
require "king.rb"
require "knight.rb"
require "pawn.rb"
require "player.rb"
require "queen.rb"

class ChessSet
    attr_reader :color
    attr_accessor :pieces, :valid_moves

    def initialize(color)
        @color = color
        @pieces = get_pieces(@color) ##an array of piece instances
        @valid_moves = []
    end

    def get_pieces(color)
        finally = []

        (1..8).each do |num|
            finally << Pawn.new(num, color)
        end

        (1..2).each do |num|
            finally << Castle.new(num, color)
        end

        (1..2).each do |num|
            finally << Knight.new(num, color)
        end

        (1..2).each do |num|
            finally << Rook.new(num, color)
        end

        finally << Queen.new(color)
        finally << King.new(color)

        return finally
    end

    def valid_moves(pieces)
        finally = []

        pieces.each do |piece|
            piece.valid_moves.each do |valid_move|
                finally << valid_move
            end
        end

        @valid_moves = finally
    end

end