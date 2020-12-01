class Board
  def initialize
    puts "Board has been initialized."
  end

  def display_board
    puts "   +---+---+---+---+---+---+---+---+"
    puts display_helper(7)
    puts "   +---+---+---+---+---+---+---+---+"
    puts display_helper(6)
    puts "   +---+---+---+---+---+---+---+---+"
    puts display_helper(5)
    puts "   +---+---+---+---+---+---+---+---+"
    puts display_helper(4)
    puts "   +---+---+---+---+---+---+---+---+"
    puts display_helper(3)
    puts "   +---+---+---+---+---+---+---+---+"
    puts display_helper(2)
    puts "   +---+---+---+---+---+---+---+---+"
    puts display_helper(1)
    puts "   +---+---+---+---+---+---+---+---+"
    puts display_helper(0)
    puts "   +---+---+---+---+---+---+---+---+"
    puts "     0   1   2   3   4   5   6   7"
  end

  def display_helper(file)
    tmp = @board[file].map { |rank| "| #{rank} "}
    tmp.unshift(" #{file} ")
    tmp.push("|")
    tmp.join
  end
end