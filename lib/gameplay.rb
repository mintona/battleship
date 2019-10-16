class Gameplay

  attr_reader :computer, :player
  attr_accessor :play_game, :prep, :computer_board, :player_board

  def initialize
    @play_game = true
    @prep = nil
    @computer = nil
    @player = nil
    @computer_board = {}
    @player_board = {}
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
    puts "        wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww \n"
  end

  def play?
    puts "\nEnter P to play. Enter Q to quit."
    print "> "
    answer = gets.chomp

    until answer.downcase == "p" or answer.downcase == "q" do
      puts "\nPlease enter either P or Q."
      print "> "
      answer = gets.chomp
    end

    if answer.downcase == "p"
      @play_game = true
    elsif answer.downcase == "q"
      @play_game = false
      puts "\nOK. Come back another time."
    end
  end

  def start
    @prep = Prep.new if @play_game == true
  end

  def setup
    @prep.create_computer_player
    @computer = @prep.computer

    @prep.create_player
    @player = @prep.player

    @computer_board = @prep.computer_board
    @player_board = @prep.player_board

    @prep.computer_places_ships
    @prep.player_places_ships
  end

  def all_computer_ships_sunk?
    @computer.ships.all? { |ship| ship.sunk? }
  end

  def all_player_ships_sunk?
    @player.ships.all? { |ship| ship.sunk? }
  end

  def play_rounds
    turn = Turn.new(@prep.all_players, @prep.all_boards)

    until all_computer_ships_sunk? || all_player_ships_sunk?
      turn.take_turn_player(turn.player_coordinate)
        if all_computer_ships_sunk?
          break
        end
      turn.take_turn_computer(turn.computer_coordinate)
        if all_player_ships_sunk?
          break
        end
    end
  end

  def end_game
    if all_player_ships_sunk?
      puts "\nI won!"
    elsif all_computer_ships_sunk?
      puts "\nYou won!"
    end
      puts "\nWould you like to play again?"
  end

end
