class Knight
    attr_reader :num, :color
    attr_accessor :status, :location, :valid_moves
    def initialize(num, color)
        @num = num
        @color = color
        @status = "free"
        @location = set_location(@num, @color)
        @valid_moves = []
    end

    def set_location(num, color)
        row = 0
        if color == "black"
            row = 8
        else
            row = 1
        end

        col = 0
        case num
            when 1
                col = "b"
            when 2
                col = "g"
        end

        return "#{col}#{row}"
    end

    def next_valid_moves(board_array)
        finally = []
        location_coordinates = @location.split("")
        this_col = location_coordinates[1]
        this_row = location_coordinates[0]
        finally << valid_tall_left_up(board_array, this_row, this_col)
        finally << valid_tall_left_down(board_array, this_row, this_col)
        finally << valid_tall_right_down(board_array, this_row, this_col)
        finally << valid_tall_right_up(board_array, this_row, this_col)
        finally << valid_short_left_up(board_array, this_row, this_col)
        finally << valid_short_left_down(board_array, this_row, this_col)
        finally << valid_short_right_down(board_array, this_row, this_col)
        finally << valid_short_right_up(board_array, this_row, this_col)

        return finally
    end

    def valid_tall_left_up(board_array, this_row, this_col)
        next_row = this_row + 2
        next_col = this_col + 1

        if next_row < 9 && next_col < 9 && @color != board_array[next_row][next_col].color
            return "#{next_row}#{next_col}"
        end
    end

    def valid_tall_left_down(board_array, this_row, this_col)
        next_row = this_row - 2
        next_col = this_col + 1

        if next_row > 0 && next_col < 9 && @color != board_array[next_row][next_col].color
            return "#{next_row}#{next_col}"
        end
    end

    def valid_tall_right_down(board_array, this_row, this_col)
        next_row = this_row - 2
        next_col = this_col - 1

        if next_row > 0 && next_col > 0 && @color != board_array[next_row][next_col].color
            return "#{next_row}#{next_col}"
        end
    end

    def valid_tall_right_up(board_array, this_row, this_col)
        next_row = this_row + 2
        next_col = this_col - 1

        if next_row < 9 && next_col > 0 && @color != board_array[next_row][next_col].color
            return "#{next_row}#{next_col}"
        end
    end

    def valid_short_left_up(board_array, this_row, this_col)
        next_row = this_row + 1
        next_col = this_col + 2

        if next_row < 9 && next_col < 9 && @color != board_array[next_row][next_col].color
            return "#{next_row}#{next_col}"
        end
    end

    def valid_short_left_down(board_array, this_row, this_col)
        next_row = this_row - 1
        next_col = this_col + 2

        if next_row < 9 && next_col > 0 && @color != board_array[next_row][next_col].color
            return "#{next_row}#{next_col}"
        end
    end

    def valid_short_right_down(board_array, this_row, this_col)
        next_row = this_row - 1
        next_col = this_col - 2

        if next_row > 0 && next_col > 0 && @color != board_array[next_row][next_col].color
            return "#{next_row}#{next_col}"
        end
    end

    def valid_short_right_up(board_array, this_row, this_col)
        next_row = this_row + 1
        next_col = this_col - 2

        if next_row < 9 && next_col > 0 && @color != board_array[next_row][next_col].color
            return "#{next_row}#{next_col}"
        end
    end

end