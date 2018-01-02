require_relative 'bingo_board'
# The Player class holds information relating to the players of a bingo game.
# A game of Bingo (bingo.rb) has_many Players, a Player belongs_to a game of
# Bingo. The class currently only holds the player_number and a relation to
# a BingoBoard but will record wins/loses etc at a later date.
class Player
  attr_reader :board, :player_number

  def initialize(player_number)
    @player_number = player_number
    @board = BingoBoard.new(@player_number)
  end
end
