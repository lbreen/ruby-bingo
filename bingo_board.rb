class BingoBoard
  attr_reader :numbers

  def initialize(player_number)
    @numbers = [[], [], []]
    @player_number = player_number
    pick_numbers
  end

  def display
    puts "Player #{@player_number}'s bingo card..."
    @numbers.each do |row_nums|
      row
      num_row(row_nums)
    end
    row
    puts ''
  end

  def bingo?
    # Return false if one of the elements is not "XX"
    @numbers.flatten.each { |num| return false if num != 'XX' }
    true
  end

  def cross_number(selected_num)
    @numbers.each do |row_nums|
      row_nums.map! { |num| num == selected_num ? 'XX' : num }
    end
  end

  private

  def row
    puts '+ -- + -- + -- + -- + -- +'
  end

  def num_row(nums)
    puts "|  #{nums[0]} | #{nums[1]} | #{nums[2]} | #{nums[3]} | #{nums[4]} |"
  end

  def pick_numbers
    board_nums = []
    x = 1; y = 9
    until board_nums.count == 5
      board_nums << (x..y).to_a.sample(3).sort
      x += 10; y += 10
    end

    board_nums.each do |row_nums|
      row_nums.each_with_index { |num, index| @numbers[index] << num }
    end
  end
end
