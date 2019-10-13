class Start
  attr_accessor :play_game, :play

  def initialize
    @play_game = false
    @play = nil
  end

  def greeting
    puts "\n\nWelcome to BATTLESHIP\n\n"
  end

  def play?
    puts "Enter P to play. Enter Q to quit"
    print ">"
    answer = gets.chomp
    if answer.downcase == "p"
      @play_game = true
      @play = Play.new
      @play.start = true
      @play.play_game
      # create_a_board_with_cells
      # create_computer_player
    elsif answer.downcase == "q"
      puts "OK. Come back another time."
    else
      puts "Please enter a valid input."
      # Add code to re-run the code until the user either says yes or no
    end
  end

end
