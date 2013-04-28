class Piece
  attr_accessor :color, :pos, :board

  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

	# REV: There will be a game loop here, right? Assuming you didn't get to it...
