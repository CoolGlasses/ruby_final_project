class Pawn
    attr_reader :num, :color
    attr_accessor :status, :valid_moves
    def initialize(num, color)
        @num = num
        @color = color
        @status = "free"
        @location = set_location(@num, @color)
        @valid_moves = []
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

        col = 0
        case num
            when 1
                col = "a"
            when 2
                col = "b"
            when 3
                col = "c"
            when 4
                col = "d"
            when 5
                col = "e"
            when 6
                col = "f"
            when 7
                col = "g"
            when 8
                col = "h"
        end
        return "#{col}#{row}"
    end

    def next_valid_moves(board_array)
        finally = []
        location_coordinates = @location.split("")
        this_col = location_coordinates[0]
        this_row = location_coordinates[1]
        
        if @color == "white"
            move_one = this_row + 1
            move_two = this_row + 2
        else
            move_one = this_row - 1
            move_two = this_row - 2
        end
        
        if board_array[this_col][move_one] == " "
            finally << "#{this_col}#{move_one}"
        end

        if board_array[this_col][up_two] == " " && (this_row == 7 || this_row == 2)
            finally << "#{this_col}#{move_two}"
        end

        return finally
    end

end