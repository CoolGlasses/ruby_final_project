require "byebug"
require "yaml"
require_relative "game"
require_relative "bishop"
require_relative "board"
require_relative "castle"
require_relative "chessSet"
require_relative "king"
require_relative "knight"
require_relative "pawn"
require_relative "player"
require_relative "queen"

  user_game_choice = ""

  acceptable_choice = false
  while !acceptable_choice
    acceptable_choice = true
    puts "Welcome to Chess in Ruby!"
    puts
    puts "New Game?(N)"
    puts "Load Saved Game?(S)"
    user_game_choice = gets.chomp

    if user_game_choice.downcase != "n" && user_game_choice != "s"
      acceptable_choice = false
      puts "Sorry, that input is not recognized"
      puts
    end
  end

  if user_game_choice.downcase == "s"
    file_exists = false
    while !file_exists
        file_exists = true
        puts
        puts "What Game # would you like to load? (Enter number just before the .txt)"
        directory = Dir.getwd
        puts
        puts Dir.glob("#{directory}/*.{txt, TXT}").join(",\n")
        puts
        game_to_load = gets.chomp
        if !File.exists?("saved_game_#{game_to_load}.txt")
            file_exists = false
            puts
            puts "I'm sorry, that file does not exist."
        end
    end

    chess = Game.new      
    chess.load_game(game_to_load)
  else
    puts
    puts "~~~~~NEW GAME~~~~~"
    puts

    player1 = Player.new
    player2 = Player.new(player1.color)
    board = Board.new
    this_game_number = rand 100000
    chess = Game.new(player1, player2, board, this_game_number)
  end


until chess.game_over?
    puts
    chess.print_the_board(chess.board)
    puts
    puts
    puts "-----------------------------------"
    puts "########## This is Game Number: #{chess.this_game_number} ##########"
    puts
    puts "***** #{chess.player1.name} vs #{chess.player2.name} *****"
    puts "      Who will win the epic battle??      "
    puts

    acceptable_choice = false
    while !acceptable_choice
      acceptable_choice = true
      puts "Would you like to save before continuing? (Y/N)"
      choice = gets.chomp

      if choice.downcase != "n" && choice.downcase != "y"
        acceptable_choice = false
        puts "Sorry, that input is not recognized."
        puts
      end
    end

    if choice.downcase == "y"  
      chess.save_game
      puts
      puts "Game Number #{chess.this_game_number} has been saved!"
      puts
    end
    
    chess.play()
end