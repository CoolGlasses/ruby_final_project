class Queen
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
            return [1, 4]
        else
            return [8, 4]
        end
    end

    def set_unicode_value(color)
        if color == "white"
            return "\u2655"
        else
            return "\u265b"
        end
    end

    def next_valid_moves(board_array)
        finally = []
        this_col = @location[1]
        this_row = @location[0]

        left_up = valid_diagonal_left_up(board_array, this_row, this_col)
        left_down = valid_diagonal_left_down(board_array, this_row, this_col)
        right_up = valid_diagonal_right_up(board_array, this_row, this_col)
        right_down = valid_diagonal_right_down(board_array, this_row, this_col)
        right = valid_horizontal_moves_right(board_array, this_row, this_col)
        left = valid_horizontal_moves_left(board_array, this_row, this_col)
        up = valid_vertical_moves_up(board_array, this_row, this_col)
        down = valid_vertical_moves_down(board_array, this_row, this_col)

        finally << left_up if !left_up.nil?
        finally << left_down if !left_down.nil?
        finally << right_up if !right_up.nil?
        finally << right_down if !right_down.nil?
        finally << right if !right.nil?
        finally << left if !left.nil?
        finally << up if !up.nil?
        finally << down if !down.nil?

        @valid_moves = finally.flatten
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
                    finally << [next_row, next_col].join("")
                    next_row += 1
                    next_col -= 1
                elsif @color != board_array[next_row][next_col].color
                    done = true
                    finally << [next_row, next_col].join("")
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
            if next_row == 0 || next_col == 0
                done = true
            else
                if board_array[next_row][next_col] == " " 
                    finally << [next_row, next_col].join("")
                    next_row -= 1
                    next_col -= 1
                elsif @color != board_array[next_row][next_col].color
                    done = true
                    finally << [next_row, next_col].join("")
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
                    finally << [next_row, next_col].join("")
                    next_row += 1
                    next_col += 1
                elsif @color != board_array[next_row][next_col].color
                    done = true
                    finally << [next_row, next_col].join("")
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
                    finally << [next_row, next_col].join("")
                    next_row -= 1
                    next_col += 1
                elsif @color != board_array[next_row][next_col].color
                    done = true
                    finally << [next_row, next_col].join("")
                else
                    done = true
                end
            end
        end

        return finally
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