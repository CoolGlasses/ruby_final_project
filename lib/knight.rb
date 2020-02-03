class Knight
    attr_reader :num, :color, :unicode
    attr_accessor :status, :location, :valid_moves
    def initialize(num, color)
        @num = num
        @color = color
        @status = "free"
        @location = set_location(@num, @color)
        @valid_moves = []
        @unicode = set_unicode_value(@color)
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
                col = 2
            when 2
                col = 7
        end

        return [row, col]
    end

    def set_unicode_value(color)
        if color == "white"
            return "\u2658"
        else
            return "\u265e"
        end
    end

    def next_valid_moves(board_array)
        finally = []
        this_col = @location[1]
        this_row = @location[0]
        finally << valid_tall_left_up(board_array, this_row, this_col)
        finally << valid_tall_left_down(board_array, this_row, this_col)
        finally << valid_tall_right_down(board_array, this_row, this_col)
        finally << valid_tall_right_up(board_array, this_row, this_col)
        finally << valid_short_left_up(board_array, this_row, this_col)
        finally << valid_short_left_down(board_array, this_row, this_col)
        finally << valid_short_right_down(board_array, this_row, this_col)
        finally << valid_short_right_up(board_array, this_row, this_col)

        return finally.flatten
    end

    def valid_tall_left_up(board_array, this_row, this_col) ##What if the cell we're looking to move to is empty?  .color will return a No Method Error
        next_row = this_row + 2
        next_col = this_col + 1

        if next_row < 9 && next_col < 9
            if board_array[next_row][next_col] == " "
                return [next_row, next_col].join("")
            elsif @color != board_array[next_row][next_col].color
                return [next_row, next_col].join("")
            end
        end
    end

    def valid_tall_left_down(board_array, this_row, this_col)
        next_row = this_row - 2
        next_col = this_col + 1

        if next_row > 0 && next_col < 9
            if board_array[next_row][next_col] == " "
                return [next_row, next_col].join("")
            elsif @color != board_array[next_row][next_col].color
                return [next_row, next_col].join("")
            end
        end
    end

    def valid_tall_right_down(board_array, this_row, this_col)
        next_row = this_row - 2
        next_col = this_col - 1

        if next_row > 0 && next_col > 0
            if board_array[next_row][next_col] == " "
                return [next_row, next_col].join("")
            elsif @color != board_array[next_row][next_col].color
                return [next_row, next_col].join("")
            end
        end
    end

    def valid_tall_right_up(board_array, this_row, this_col)
        next_row = this_row + 2
        next_col = this_col - 1

        if next_row < 9 && next_col > 0
            if board_array[next_row][next_col] == " "
                return [next_row, next_col].join("")
            elsif @color != board_array[next_row][next_col].color
                return [next_row, next_col].join("")
            end
        end
    end

    def valid_short_left_up(board_array, this_row, this_col)
        next_row = this_row + 1
        next_col = this_col + 2

        if next_row < 9 && next_col < 9
            if board_array[next_row][next_col] == " "
                return [next_row, next_col].join("")
            elsif @color != board_array[next_row][next_col].color
                return [next_row, next_col].join("")
            end
        end
    end

    def valid_short_left_down(board_array, this_row, this_col)
        next_row = this_row - 1
        next_col = this_col + 2

        if next_row > 0 && next_col < 9
            if board_array[next_row][next_col] == " "
                return [next_row, next_col].join("")
            elsif @color != board_array[next_row][next_col].color
                return [next_row, next_col].join("")
            end
        end
    end

    def valid_short_right_down(board_array, this_row, this_col)
        next_row = this_row - 1
        next_col = this_col - 2

        if next_row > 0 && next_col > 0
            if board_array[next_row][next_col] == " "
                return [next_row, next_col].join("")
            elsif @color != board_array[next_row][next_col].color
                return [next_row, next_col].join("")
            end
        end
    end

    def valid_short_right_up(board_array, this_row, this_col)
        next_row = this_row + 1
        next_col = this_col - 2

        if next_row < 9 && next_col > 0 
            if board_array[next_row][next_col] == " "
                return [next_row, next_col].join("")
            elsif @color != board_array[next_row][next_col].color
                return [next_row, next_col].join("")
            end
        end
    end

end