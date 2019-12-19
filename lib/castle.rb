class Castle
    attr_reader :num, :color
    attr_accessor :status, :location
    def initialize(num, color)
        @num = num
        @color = color
        @status = "free"
        @location = set_location(@num, @color)
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
                col = "a"
            when 2
                col = "h"
        end

        return "#{col}#{row}"
    end
end