require_relative 'bingo_board'

class Bingo
  def initialize
    # Generate a new bingoboard and populate it with numbers
    @board = BingoBoard.new
    @remaining_numbers = (1..49).to_a
    @selected_numbers = []
    @bingo = false
  end

  def play
    @board.display
    puts 'Would you like to start? (y/n)'
    print '> '
    response = gets.chomp
    puts ''
    if response.downcase == 'y'
      until @bingo == true
        puts "Previous numbers: #{@selected_numbers}"
        number = select_number
        puts "Current number: #{number}"

        @board.cross_number(number)
        @board.display

        bingo if @board.bingo?

        puts 'Press ENTER to continue.'
        gets.chomp
      end
    else
      puts 'Goodbye!'
    end
  end

  private

  def select_number
    # Select a random number from those remaining and remove from array
    number = @remaining_numbers.sample
    @remaining_numbers.delete(number)
    @selected_numbers << number
    number
  end

  def bingo
    @bingo = true
    puts '**BINGO!!**'
  end
end

bingo = Bingo.new
bingo.play
