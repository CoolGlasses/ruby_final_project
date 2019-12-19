class Queen
    attr_reader :num, :color
    attr_accessor :status, :location
    def initialize(num, color)
        @num = num
        @color = color
        @status = "free"
        @location = place_queen(@color)
    end

    def set_location(color)
        if color == "white"
            return "d1"
        else
            return "d8"
        end
    end
end