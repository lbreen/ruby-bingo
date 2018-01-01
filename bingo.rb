require_relative 'bingo_board'
require_relative 'player'

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

    until @bingo == true
      puts 'Press ENTER to continue.'
      gets.chomp

      puts "Previous numbers: #{@selected_numbers}"
      number = select_number
      puts "Current number: #{number}"

      update_player_boards(number)

      # Only want to be called until the first line is completed
      player_has_line unless @line
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
      if player.board.bingo?
        @bingo = true
        puts '**BINGO!!**'
        puts "Player #{player.number} has won."
      end
    end
  end

  def player_has_line
    @players.each do |player|
      if player.board.line?
        @line = true
        puts "Player #{player.number} has a line!"
      end
    end
  end
end

bingo = Bingo.new
playing = true

until playing == false
  puts 'Would you like to play bingo? (y/n)'
  print '> '
  response = gets.chomp.downcase

  if response == 'y'
    bingo.play
  elsif response == 'n'
    playing = false
  else
    puts 'Please enter y or n'
  end
end


