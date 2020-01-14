class Bishop
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
                col = "c"
            when 2
                col = "f"
        end

        return "#{row}#{col}"
    end

    def next_valid_moves(board_array)
        finally = []
        location_coordinates = @location.split("")
        this_col = location_coordinates[1]
        this_row = location_coordinates[0]
        finally << valid_diagonal_left_up(board_array, this_row, this_col)
        finally << valid_diagonal_left_down(board_array, this_row, this_col)
        finally << valid_diagonal_right_down(board_array, this_row, this_col)
        finally << valid_diagonal_right_up(board_array, this_row, this_col)

        return finally
    end

    def valid_diagonal_right_up(board_array, this_row, this_col)
        finally = []
        next_row = this_row + 1
        next_col = this_col - 1

        done = false
        while !done
            if next_row == 9 || next_col == 0
                done = true
            else
                if board_array[next_row][next_col] == " " 
                    finally << "#{next_row}#{next_col}"
                    next_row += 1
                    next_col -= 1
                elsif @color != board_array[next_row][next_col].color
                    done = true
                    finally << "#{next_row}#{next_col}"
                else
                    done = true
                end
            end
        end

        return finally
    end

    def valid_diagonal_right_down(board_array, this_row, this_col)
        finally = []
        next_row = this_row - 1
        next_col = this_col - 1

        done = false
        while !done
            if next_row == 0 || next_col == 00
                done = true
            else
                if board_array[next_row][next_col] == " " 
                    finally << "#{next_row}#{next_col}"
                    next_row -= 1
                    next_col -= 1
                elsif @color != board_array[next_row][next_col].color
                    done = true
                    finally << "#{next_row}#{next_col}"
                else
                    done = true
                end
            end
        end

        return finally
    end

    def valid_diagonal_left_up(board_array, this_row, this_col)
        finally = []
        next_row = this_row + 1
        next_col = this_col + 1

        done = false
        while !done
            if next_row == 9 || next_col == 9
                done = true
            else
                if board_array[next_row][next_col] == " " 
                    finally << "#{next_row}#{next_col}"
                    next_row += 1
                    next_col += 1
                elsif @color != board_array[next_row][next_col].color
                    done = true
                    finally << "#{next_row}#{next_col}"
                else
                    done = true
                end
            end
        end

        return finally
    end

    def valid_diagonal_left_down(board_array, this_row, this_col)
        finally = []
        next_row = this_row - 1
        next_col = this_col + 1

        done = false
        while !done
            if next_row == 0 || next_col == 9
                done = true
            else
                if board_array[next_row][next_col] == " " 
                    finally << "#{next_row}#{next_col}"
                    next_row -= 1
                    next_col += 1
                elsif @color != board_array[next_row][next_col].color
                    done = true
                    finally << "#{next_row}#{next_col}"
                else
                    done = true
                end
            end
        end

        return finally
    end 


end