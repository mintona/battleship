require_relative './lib/ship.rb'
require_relative './lib/cell.rb'
require_relative './lib/board.rb'
require_relative './lib/round.rb'
require_relative './lib/computer.rb'
require_relative './lib/person.rb'
require_relative './lib/start.rb'
require_relative './lib/gameplay.rb'
require_relative './lib/setup.rb'
require 'pry'

# The code below works for master as it is as of 10/15 @ 4 pm
# start = Start.new
# start.greeting
# until start.play_game == false
#   start.play?
# end



game_1 = Gameplay.new
binding.pry
