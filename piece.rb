require_relative "board"

class Piece
  attr_accessor :color, :pos, :board, :promoted

  # red pawn's moves
  S_DELTAS_RED = [[-1,1], [-1,-1]]
  J_DELTAS_RED = [[-2,2], [-2,-2]]
  # black pawn's moves
  S_DELTAS_BLACK = [[1,1], [1,-1]]
  J_DELTAS_BLACK = [[2,2], [2,-2]]
  # king piece's moves
  S_DELTAS_KING = S_DELTAS_RED + S_DELTAS_BLACK
  J_DELTAS_KING = J_DELTAS_RED + J_DELTAS_BLACK


  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
    @promoted = false
  end

  def slide_set
    start = @pos
    cur_x, cur_y = start
    if !@promoted
      moves = @color == :B ? S_DELTAS_BLACK : S_DELTAS_RED
    else
      moves = S_DELTAS_KING
    end
    pos_slides = []
    moves.each do |dx, dy|
      pos_move = [cur_x + dx, cur_y + dy]
      pos_slides << pos_move  # we'll check move set legality in the actual perform_slide function
    end
    pos_slides
  end

  def jump_set
    start = @pos
    if !@promoted
      moves = @color == :B ? J_DELTAS_BLACK : J_DELTAS_RED
    else
      moves = J_DELTAS_KING
    end
    pos_jumps = []
    moves.each do |dx, dy|
      pos_move = [cur_x + dx, cur_y + dy]
      pos_jumps << pos_move  # we'll check move set legality in the actual perform_jump function
    end
    pos_jumps
  end

  def king_me
    @promotion = true
  end


end