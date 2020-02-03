class King
    attr_reader :num, :color, :unicode
    attr_accessor :status, :location, :valid_moves

    def initialize(color)
        @color = color
        @status = "free"
        @location = set_location(@color)
        @valid_moves = []
        @unicode = set_unicode_value(@color)
    end

    def set_location(color)
        if color == "white"
            return [1, 5]
        else
            return [8, 5]
        end
    end

    def set_unicode_value(color)
        if color == "white"
            return "\u2654"
        else
            return "\u265a"
        end
    end

    def next_valid_moves(board_array)
        finally = []
        this_col = @location[1]
        this_row = @location[0]
        finally << valid_move_up(board_array, this_row, this_col)
        finally << valid_move_left(board_array, this_row, this_col)
        finally << valid_move_down(board_array, this_row, this_col)
        finally << valid_move_right(board_array, this_row, this_col)

        return finally.flatten
    end

    def valid_move_up(board_array, this_row, this_col)
        next_row = this_row + 1

        if next_row < 9
            if board_array[next_row][this_col] == " "
                return [next_row, this_col].join("")
            elsif @color != board_array[next_row][this_col].color
                return [next_row, this_col].join("")
            end
        end
    end

    def valid_move_left(board_array, this_row, this_col)
        next_col = this_col + 1

        if next_col < 9
            if board_array[this_row][next_col] == " "
                return [this_row, next_col].join("")
            elsif @color != board_array[this_row][next_col].color
                return [this_row, next_col].join("")
            end
        end
    end

    def valid_move_down(board_array, this_row, this_col)
        next_row = this_row - 1

        if next_row > 0
            if board_array[next_row][this_col] == " "
                return [next_row, this_col].join("")
            elsif @color != board_array[next_row][this_col].color
                return [next_row, this_col].join("")
            end
        end
    end

    def valid_move_right(board_array, this_row, this_col)
        next_col = this_col - 1

        if next_col > 0
            if board_array[this_row][next_col] == " "
              return [this_row, next_col].join("")
            elsif @color != board_array[this_row][next_col].color
                return [this_row, next_col].join("")
            end
        end
    end
end