require_relative './lib/ship.rb'
require_relative './lib/cell.rb'
require_relative './lib/board.rb'
require_relative './lib/round.rb'
require_relative './lib/computer.rb'
require_relative './lib/player.rb'
require_relative './lib/start.rb'
require_relative './lib/gameplay.rb'
require_relative './lib/prep.rb'
require_relative './lib/turn.rb'
require 'pry'

# The code below works for master as it is as of 10/15 @ 4 pm
# start = Start.new
# start.greeting
# until start.play_game == false
#   start.play?
# end



game = Gameplay.new

game.greeting
until game.play_game == false
game.play?
  if game.play_game? == true
    game.start
    game.setup
    game.play_rounds
    game.end_game
  end
end
