require_relative "board"

class King < Piece										# REV: We may have even talked about this, but do you really 
  attr_accessor :color, :pos, :board	# need a King class? Couldn't it just be an attribute of Piece?

  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  def slide_set
    start = @pos
    cur_x, cur_y = start
    moves = [[1,1], [1,-1], [-1,1], [-1,-1]]  # REV: Isn't this info already covered in your deltas?
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
