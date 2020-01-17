class King
    attr_reader :num, :color
    attr_accessor :status, :location, :valid_moves

    def initialize(num, color)
        @num = num
        @color = color
        @status = "free"
        @location = set_location(@color)
        @valid_moves = []

    end

    def set_location(color)
        if color == "white"
            return [1, 5]
        else
            return [8, 5]
        end
    end

    def next_valid_moves(board_array)
        finally = []
        this_col = location[1]
        this_row = location[0]
        finally << valid_move_up(board_array, this_row, this_col)
        finally << valid_move_left(board_array, this_row, this_col)
        finally << valid_move_down(board_array, this_row, this_col)
        finally << valid_move_right(board_array, this_row, this_col)

        return finally
    end

    def valid_move_up(board_array, this_row, this_col)
        next_row = this_row + 1

        if next_row < 9 && @color != board_array[next_row][next_col].color
            return [next_row, this_col]
        end
    end

    def valid_move_left(board_array, this_row, this_col)
        next_col = this_col + 1

        if next_col < 9 && @color != board_array[next_row][next_col].color
            return [this_row, next_col]
        end
    end

    def valid_move_down(board_array, this_row, this_col)
        next_row = this_row - 1

        if next_row < 0 && @color != board_array[next_row][next_col].color
            return [next_row, this_col]
        end
    end

    def valid_move_right(board_array, this_row, this_col)
        next_col = this_col - 1

        if next_col > 0 && @color != board_array[next_row][next_col].color
            return [this_row, next_col]
        end
    end

end