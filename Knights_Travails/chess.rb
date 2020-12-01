require './board.rb'
require './knight.rb'
require './node.rb'

class Chess
  def initialize
    puts "Chess has been initialized."
    @board = Board.new
    @knight = Knight.new
  end

  def start_game
    place_piece([3,4], @knight)
    display_board
    moves = calculate_moves([3,4])
    update_board(moves)
  end

  def display_board
    @board.display_board
  end

  def place_piece(position, piece)
    @board.place_piece(position, piece)
  end

  def calculate_moves(pos)
    @knight.calculate_moves(pos)
  end

  def update_board(moves)
    @board.place_x(moves)
    @board.display_board
  end
end

chess = Chess.new
chess.start_game