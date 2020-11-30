class Chess
  def initialize
    @board = Board.new
    @knight = Knight.new(@board)
  end

  def knight_moves(pos)
    place_piece(pos, @knight.mark)
    display_board
  end

  def place_piece(pos, mark)
    @board.place_piece(pos, mark)
  end

  def display_board
    @board.display
  end
end

class Knight
  attr_reader :mark
  def initialize(board)
    @board = board
    @mark = 'K'
  end


end

class Board
  def initialize
    @board = Array.new(8) { Array.new(8, ' ') }
  end

  def display
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

  def place_piece(pos, mark)
    x, y = pos[0], pos[1]
    @board[x][y] = mark
  end
end

chess = Chess.new
chess.knight_moves([4,4])