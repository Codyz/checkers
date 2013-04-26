require_relative "board"

class Piece
  attr_accessor :color, :pos, :board, :promoted

  # red pawn's moves
  S_DELTAS_RED = [[-1,1], [-1,-1]]
  J_DELTAS_RED = [[-2,2], [-2,-2]]
  # black pawn's moves
  S_DELTAS_RED = [[-1,1], [-1,-1]]
  J_DELTAS_RED = [[-2,2], [-2,-2]]


  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  def slide_set
    start = @pos
    cur_x, cur_y = start
    @color == :B ? x = 1 : x = -1
    moves = [[x,1], [x,-1]]
    pos_slides = []
    moves.each do |dx, dy|
      pos_move = [cur_x + dx, cur_y + dy]
      pos_slides << pos_move  # we'll check move set legality in the actual perform_slide function
    end
    pos_slides
  end

  def jump_set
    start = @pos
    cur_x, cur_y = start
    @color == :B ? x = 2 : x = -2
    moves = [[x,2], [x,-2]]
    pos_jumps = []
    moves.each do |dx, dy|
      pos_move = [cur_x + dx, cur_y + dy]
      pos_jumps << pos_move  # we'll check move set legality in the actual perform_jump function
    end
    pos_jumps
  end


end