class BingoBoard
  attr_reader :numbers
  attr_accessor :selected_numbers

  def initialize
    @numbers = [[], [], []]
    @selected_numbers = []
    pick_numbers
    display_board
  end

  def display_board
    puts 'Your bingo card...'
    @numbers.each do |row_nums|
      row
      num_row(row_nums)
    end
    row
  end

  private

  def row
    puts '+ -- + -- + -- + -- + -- +'
  end

  def num_row(nums)
    nums.map! { |num| num.to_s.split('').count == 1 ? "0#{num}" : num.to_s }
    puts "| #{nums[0]} | #{nums[1]} | #{nums[2]} | #{nums[3]} | #{nums[4]} |"
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
