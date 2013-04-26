class Piece
  attr_accessor :color, :pos, :board

  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

