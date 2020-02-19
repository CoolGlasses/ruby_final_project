class Player
    attr_reader :name, :color

    def initialize(color=nil)
        @name = get_player_name()
        @color = get_player_color(color)
    end

    def get_player_name
        puts
        puts
        puts "Hello, what is your name?"
        name = gets.chomp

        return name
    end

    def get_player_color(color) ##needs error checking
        valid = false
        while !valid
            if color == nil
                puts
                puts
                puts "Please select a valid color.  (White -or- Black)"
                puts
                puts "What color would you like to be?"
                color = gets.chomp
            elsif color.downcase == "black"
                color = "white"
            else
                color = "black"
            end

            if color.downcase == "white" || color.downcase == "black"
                valid = true
            end
        end
        return color.downcase
    end
end