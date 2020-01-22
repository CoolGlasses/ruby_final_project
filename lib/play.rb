require "byebug"
require_relative "game"

def play
    new_game = Game.new
    new_game.play
end

play()