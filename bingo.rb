require_relative 'bingo_board'
require_relative 'player'
# The Bingo class is the controller for the Player and BingoBoard models.
# It controls the progression of the game and the creation of new Player
# and BingoBoard instances. The primary method of the Bingo class is the
# 'play' method which dictates the order of play.
class Bingo
  def initialize
    @players = []
    @remaining_numbers = (1..49).to_a
    @selected_numbers = []
    @bingo = false
    @line = false
  end

  def play
    build_players

    @players.each { |player| player.board.display }

    @players.first.board.display
    until @bingo == true
      puts 'Press ENTER to continue.'
      gets.chomp

      puts "Previous numbers: #{@selected_numbers}"
      number = select_number
      puts "Current number: #{number}"

      update_player_boards(number)

      player_has_line unless @line # Don't call if a player already has a line
      player_has_bingo
    end
  end

  private

  def build_players
    number_of_players = select_players
    x = 1
    number_of_players.times do
      @players << Player.new(x)
      x += 1
    end
  end

  def select_players
    continue = false
    until continue == true
      puts 'How many players are there? (0-4)'
      print '> '
      num_of_players = gets.chomp.to_i
      if num_of_players.zero?
        puts 'That is an invalid choice'
      elsif num_of_players > 4
        puts 'Please choose 4 or less players'
      else
        puts "#{num_of_players} players selected"
        continue = true
      end
    end

    num_of_players
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

  def player_has_bingo
    @players.each do |player|
      next unless player.board.bingo?
      @bingo = true
      puts '**BINGO!!**'
      puts "Player #{player.player_number} has won."
    end
  end

  def player_has_line
    @players.each do |player|
      next unless player.board.line?
      @line = true
      puts "Player #{player.player_number} has a line!"
    end
  end
end

playing = true

# Router logic
until playing == false
  puts 'Would you like to play bingo? (y/n)'
  print '> '
  response = gets.chomp.downcase

  if response == 'y'
    bingo = Bingo.new
    bingo.play
  elsif response == 'n'
    playing = false
  else
    puts 'Please enter y or n'
  end
end
