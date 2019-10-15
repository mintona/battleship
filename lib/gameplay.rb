class Gameplay

  attr_accessor :play_game, :turn, :setup

  def initialize
    @play_game = true
    @setup = nil
    @turn = nil

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
    puts "Enter P to play. Enter Q to quit."
    print "> "
    answer = gets.chomp

    until answer.downcase == "p" or answer.downcase == "q" do
      puts "\nPlease enter a valid input."
      print "> "
      answer = gets.chomp
    end

    if answer.downcase == "p"
      #@play_game = true
      # @round = Round.new
      # @round.start = true
      # @round.play_game
    elsif answer.downcase == "q"
      @play_game = false
      puts "\nOK. Come back another time."
    end
  end

  def start
    @setup = Setup.new
  end

  def take_turns
    #player takes a turn
    #check to see if any ships were sunk
      #if all ships were sunk, end
    #computer takes a turn
      #if all ships were sunk, end
  end

end
