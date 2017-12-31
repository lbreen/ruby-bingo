require_relative 'bingo_board'
require_relative 'player'

class Bingo
  def initialize
    @players = []
    select_players
    @remaining_numbers = (1..49).to_a
    @selected_numbers = []
    @bingo = false
  end

  def play
    @players.each { |player| player.board.display }
    puts 'Would you like to start? (y/n)'
    print '> '
    response = gets.chomp
    puts ''
    if response.downcase == 'y'
      until @bingo == true
        puts "Previous numbers: #{@selected_numbers}"
        number = select_number
        puts "Current number: #{number}"

        update_player_boards(number)

        bingo?

        puts 'Press ENTER to continue.'
        gets.chomp
      end
    else
      puts 'Goodbye!'
    end
  end

  private

  def select_players
    continue = false
    until continue == true
      puts 'How many players are there? (0-4)'
      print '> '
      response = gets.chomp.to_i
      if response == 0
        puts 'That is an invalid choice'
      elsif response > 4
        puts 'Please choose 4 or less players'
      else
        puts "#{response} players selected"
        continue = true
      end
    end
    x = 1
    response.times do
      @players << Player.new(x)
      x += 1
    end
  end

  def update_player_boards(selected_number)
    @players.each do |player|
      player.board.cross_number(selected_number)
      player.board.display
    end
  end

  def select_number
    # Select a random number from those remaining and remove from array
    number = @remaining_numbers.sample
    @remaining_numbers.delete(number)
    @selected_numbers << number
    number
  end

  def bingo?
    @players.each do |player|
      if player.board.bingo?
        @bingo = true
        puts '**BINGO!!**'
        puts "Player #{player.number} has won."
      end
    end
  end
end

bingo = Bingo.new
bingo.play
