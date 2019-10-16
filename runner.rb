require_relative './lib/ship.rb'
require_relative './lib/cell.rb'
require_relative './lib/board.rb'
require_relative './lib/computer.rb'
require_relative './lib/player.rb'
require_relative './lib/gameplay.rb'
require_relative './lib/prep.rb'
require_relative './lib/turn.rb'

game = Gameplay.new

game.greeting
game.play?
until game.play_game == false
  game.start
  game.setup
  game.play_rounds
  game.end_game
  game.play?
end
