class King
    attr_reader :num, :color
    attr_accessor :status, :location
    def initialize(num, color)
        @num = num
        @color = color
        @status = "free"
        @location = place_king(@color)

    end

    def set_location(color)
        if color == "white"
            return "e1"
        else
            return "e8"
        end
    end

end