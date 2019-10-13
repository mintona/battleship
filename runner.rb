require_relative './lib/ship.rb'
require_relative './lib/cell.rb'
require_relative './lib/board.rb'
require_relative './lib/play.rb'
require_relative './lib/computer.rb'
require_relative './lib/person.rb'
require_relative './lib/start.rb'
require 'pry'


# play = Play.new
#
# play.greeting
# play.play?
# play.computer_takes_first_turn
# puts play.gameboard.render(true)

# might need to create a board here and then have the methods of play take the argument of the board so it can access the cells of the board

start = Start.new

start.greeting
start.play?
