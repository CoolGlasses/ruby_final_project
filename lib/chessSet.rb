class ChessSet
    attr_reader :color
    attr_accessor :pieces

    def initialize(color)
        @color = color
        @pieces = get_pieces(@color) ##an array of piece instances
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
end