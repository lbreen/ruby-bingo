require_relative 'bingo_board'

class Player
  attr_reader :board, :number

  def initialize(player_number)
    @number = player_number
    @board = BingoBoard.new(player_number)
  end
end
