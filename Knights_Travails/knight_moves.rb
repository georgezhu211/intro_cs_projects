class Board
  def initialize
    puts "Board Initialized."
    @board = Array.new(8) { Array.new(8, ' ') }
  end

  def display
    7.downto(0) do |i|
      puts "   +---+---+---+---+---+---+---+---+"
      puts display_helper(i)
    end
    puts "   +---+---+---+---+---+---+---+---+"
    puts "     0   1   2   3   4   5   6   7"
    @board = Array.new(8) { Array.new(8, ' ') }
  end

  def display_helper(file)
    tmp = @board[file].map { |rank| "| #{rank} "}
    tmp.unshift(" #{file} ")
    tmp.push("|")
    tmp.join
  end

  def place_piece(knight)
    position = knight.position
    x, y = position[0], position[1]
    @board[x][y] = 'K'
    place_x(knight.calculate_moves)
  end

  def place_x(arr)
    arr.each do |move|
      x, y = move[0], move[1]
      @board[x][y] = 'x'
    end

  end

end

class Knight
  attr_accessor :children, :position, :parent
  def initialize(position=nil, parent=nil)
    @position = position
    @parent = parent
    @moves = [
      [1,2],
      [1,-2],
      [-1,2],
      [-1,-2],
      [2,1],
      [2,-1],
      [-2,1],
      [-2,-1],
    ]
    @children = []
  end

  def calculate_moves
    moves = @moves.map do |move|
      move.each_with_index.map { |num, idx| num + @position[idx] }
    end
    moves = moves.select { |move| valid_move?(move) }
    moves.delete(@parent)
    moves.each { |move| @children << move }
    moves
  end
  
  def valid_move?(move)
    if move[0].between?(0,7) && move[1].between?(0,7)
      return true
    end
    false
  end
  
end

def knight_moves(start, finish)
  board = Board.new
  queue = [Knight.new(start)]
  parent = nil
  until queue.empty?
    knight = queue.shift
    parent = knight
    board.place_piece(knight)
    board.display
    knight.children.each do |child|
      queue << Knight.new(child, knight)
    end
    break if knight.position == finish
  end
  path = []
  until knight.nil? do
    path << knight.position
    knight = knight.parent
  end
  path.reverse.each { |move| p move }
end

knight_moves([3,3],[4,3])