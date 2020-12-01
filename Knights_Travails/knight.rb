class Knight
  attr_reader :mark
  def initialize
    puts "Knight has been initialized."
    @mark = 'K'
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
  end

  def calculate_moves(pos)
    @moves.map do |move|
      move.each_with_index.map { |num, idx| num + pos[idx] }
    end
  end
end