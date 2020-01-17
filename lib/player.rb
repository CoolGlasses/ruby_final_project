class Player
    attr_reader :name, :color

    def initialize(color=nil)
        @name = get_player_name()
        @color = get_player_color(color)
    end

    def get_player_name
        puts "Hello, what is your name?"
        name = gets.chomp

        return name
    end

    def get_player_color(color) ##needs error checking
        if color == nil
            puts "What color would you like to be?"
            color = gets.chomp
        elsif color.downcase == "black"
            color = "white"
        else
            color = "black"
        end

        return color
    end
end