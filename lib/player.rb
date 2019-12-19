class Player
    attr_reader :name, :color
    attr_accessor :in_check, :checkmate

    def initialize(color=nil)
        @name = get_player_name()
        @color = get_player_color(color)
        @in_check = false
        @checkmate = false
    end

    def get_player_name
        puts "Hello, what is your name?"
        name = gets.chomp

        return name
    end

    def get_player_color(color)
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