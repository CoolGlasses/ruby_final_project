class Castle
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
                col = 1
            when 2
                col = 8
        end

        return [row, col]
    end

    def set_unicode_value(color)
        if color == "white"
            return "\u2656"
        else
            return "\u265c"
        end
    end

    def next_valid_moves(board_array)
        finally = []
        this_col = @location[1]
        this_row = @location[0]
        finally << valid_horizontal_moves_right(board_array, this_row, this_col)
        finally << valid_horizontal_moves_left(board_array, this_row, this_col)
        finally << valid_vertical_moves_up(board_array, this_row, this_col)
        finally << valid_vertical_moves_down(board_array, this_row, this_col)
        
        return finally.flatten
    end

    def valid_horizontal_moves_right(board_array, this_row, this_col)
        finally = []

        next_col = this_col + 1
        done = false    
        while !done
            if next_col == 9
                done = true
            else
                if board_array[this_row][next_col] == " "
                    finally << [this_row, next_col].join("")
                    next_col += 1
                elsif @color != board_array[this_row][next_col].color
                    done = true
                    finally << [this_row, next_col].join("")
                else
                    done = true
                end
            end
        end
        
        return finally
    end

        def valid_horizontal_moves_left(board_array, this_row, this_col)
        finally = []

        next_col = this_col - 1
        done = false    
        while !done
            if next_col == 0
                done = true
            else
                if board_array[this_row][next_col] == " "
                    finally << [this_row, next_col].join("")
                    next_col -= 1
                elsif @color != board_array[this_row][next_col].color
                    done = true
                    finally << [this_row, next_col].join("")
                else
                    done = true
                end
            end
        end
        
        return finally
    end

    def valid_vertical_moves_up(board_array, this_row, this_col)
        finally = []

        next_row = this_row + 1
        done = false
        while !done
            if next_row == 9
                done = true
            else
                if board_array[next_row][this_col] == " "
                    finally << [next_row, this_col].join("")
                    next_row += 1
                elsif @color != board_array[next_row][this_col].color
                    done = true
                    finally << [next_row, this_col].join("")
                else
                    done = true
                end
            end
        end

        return finally
    end

    def valid_vertical_moves_down(board_array, this_row, this_col)
        finally = []

        next_row = this_row - 1
        done = false
        while !done
            if next_row == 0
                done = true
            else
                if board_array[next_row][this_col] == " "
                    finally << [next_row, this_col].join("")
                    next_row -= 1
                elsif @color != board_array[next_row][this_col].color
                    done = true
                    finally << [next_row, this_col].join("")
                else
                    done = true
                end
            end
        end

        return finally
    end

end