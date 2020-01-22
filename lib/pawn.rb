class Pawn
    attr_reader :num, :color, :unicode
    attr_accessor :status, :valid_moves

    def initialize(num, color)
        @num = num
        @color = color
        @status = "free"
        @location = set_location(@num, @color)
        @valid_moves = []
        @unicode = set_unicode_value(@color)
    end

    def location
        @location
    end

    def location=(board_array, destination_array)
        @location = destination_array.join("")
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

    def next_valid_moves(board_array)
        finally = []
        this_col = @location[1]
        this_row = @location[0]
        
        if @color == "white"
            move_one = this_row + 1
            move_two = this_row + 2
            attack_right = [this_row + 1, this_col + 1]
            attack_left = [this_row + 1, this_col - 1]
        else
            move_one = this_row - 1
            move_two = this_row - 2
            attack_right = [this_row - 1, this_col + 1]
            attack_left = [this_row - 1, this_col - 1]
        end
        
        if board_array[move_one][this_col] == " "
            finally << [move_one, this_col]
        end

        if board_array[move_two][this_col] == " " && (this_row == 7 || this_row == 2)
            finally << [move_two, this_col]
        end

        if board_array[attack_right[0]][attack_right[1]] != " " && @color != board_array[attack_right[0]][attack_right[1]].color
            finally << attack_right
        end

        if board_array[attack_left[0]][attack_left[1]] != " " && @color != board_array[attack_left[0]][attack_left[1]].color
            finally << attack_left
        end

        return finally
    end
end