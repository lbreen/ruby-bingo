require_relative 'bingo_board'

class Player
  attr_reader :board, :player_number

  def initialize(player_number)
    @player_number = player_number
    @board = BingoBoard.new(@player_number)
  end
end
