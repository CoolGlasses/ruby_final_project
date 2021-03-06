class Pawn
    attr_reader :num, :color, :unicode
    attr_accessor :status, :valid_moves, :location

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
            row = 7
        else
            row = 2
        end

        col = num

        return [row, col]
    end

    def set_unicode_value(color)
        if color == "white"
            return "\u2659"
        else
            return "\u265f"
        end
    end

    def next_valid_moves(board_array) ###need to allow for castling, break into smaller helper functions, etc.
        finally = []
        this_col = @location[1]
        this_row = @location[0]
        
        if @color == "white"
            one = white_move_one(board_array, this_row, this_col)
            two = white_move_two(board_array, this_row, this_col)
            attack_right = white_attack_right(board_array, this_row, this_col)
            attack_left = white_attack_left(board_array, this_row, this_col)
        else
            one = black_move_one(board_array, this_row, this_col)
            two = black_move_two(board_array, this_row, this_col)
            attack_right = black_attack_right(board_array, this_row, this_col)
            attack_left = black_attack_left(board_array, this_row, this_col)
        end

        finally << one if !one.nil?
        finally << two if !two.nil?
        finally << attack_right if !attack_right.nil?
        finally << attack_left if !attack_left.nil?

        @valid_moves = finally.flatten
    end

    def white_move_one(board_array, this_row, this_col)
        finally = []
        move_one = this_row + 1
        
        if board_array[move_one][this_col] == " "
            finally << [move_one, this_col].join("")
        end

        return finally
    end

    def white_move_two(board_array, this_row, this_col)
        finally = []
        move_two = this_row + 2

        if this_row == 2
            if board_array[move_two][this_col] == " "
                finally << [move_two, this_col].join("")
            end
        end

        return finally
    end

    def white_attack_right(board_array, this_row, this_col)
        finally = []
        attack_right = [this_row + 1, this_col + 1]

        if board_array[attack_right[0]][attack_right[1]] != " " && (this_row + 1) < 9 && (this_col + 1) < 9
            if @color != board_array[attack_right[0]][attack_right[1]].color
                finally << attack_right.join("")
            end
        end

        return finally
    end

    def white_attack_left(board_array, this_row, this_col)
        finally = []
        attack_left = [this_row + 1, this_col - 1]

        if board_array[attack_left[0]][attack_left[1]] != " "  && (this_row + 1) < 9 && (this_col - 1) > 0
            if @color != board_array[attack_left[0]][attack_left[1]].color
                finally << attack_left.join("")
            end
        end

        return finally
    end

    def black_move_one(board_array, this_row, this_col)
        finally = []
        move_one = this_row - 1

        if board_array[move_one][this_col] == " "
            finally << [move_one, this_col].join("")
        end

        return finally
    end

    def black_move_two(board_array, this_row, this_col)
        finally = []
        move_two = this_row - 2

        if this_row == 7
            if board_array[move_two][this_col] == " "
                finally << [move_two, this_col].join("")
            end
        end

        return finally
    end

    def black_attack_right(board_array, this_row, this_col)
        finally = []
        attack_right = [this_row - 1, this_col + 1]

         if board_array[attack_right[0]][attack_right[1]] != " "  && (this_row - 1) > 0 && (this_col + 1) < 9
            if @color != board_array[attack_right[0]][attack_right[1]].color
                finally << attack_right.join("")
            end
        end

        return finally
    end

    def black_attack_left(board_array, this_row, this_col)
        finally = []
        attack_left = [this_row - 1, this_col - 1]

        if board_array[attack_left[0]][attack_left[1]] != " "  && (this_row - 1) > 0 && (this_col - 1) < 0
            if @color != board_array[attack_left[0]][attack_left[1]].color
                finally << attack_left.join("")
            end
        end

        return finally
    end

end