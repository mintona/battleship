class Start
  attr_accessor :play_game, :play

  def initialize
    @play_game = false
    @round = nil
  end

  def greeting
    puts "\n\n         *~*~*~*~*~*~*~*~*~*~ Welcome to BATTLESHIP *~*~*~*~*~*~*~*~*~*~\n\n\n"

    puts "                                          # #  ( )"
    puts "                                       ___#_#___|__"
    puts "                                   _  |____________|  _"
    puts "                            _=====| | |            | | |==== _"
    puts "                      =====| |.---------------------------. | |===="
    puts "        <--------------------'   .  .  .  .  .  .  .  .   '--------------/"
    puts "          |                                                             /"
    puts "           |_______________________________________________WWS_________/"
    puts "       wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"
    puts "     wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"
    puts "        wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww \n\n"
  end

  def play?
    puts "Enter P to play. Enter Q to quit"
    print ">"
    answer = gets.chomp
    if answer.downcase == "p"
      @play_game = true
      @round = Round.new
      @round.start = true
      @round.play_game
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
