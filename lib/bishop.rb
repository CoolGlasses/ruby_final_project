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
        
        (1..9).each do |row|
            (1..9).each do |col|
                if board_array[row][col] == " " || (@color != board_array[row][col].color && (row != 0 || row != nil) && (col != 0 || col != nil))
                    finally << "#{row}#{col}"
                end
            end
        end        

        return finally
    end
end