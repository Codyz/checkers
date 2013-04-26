class Piece
  attr_accessor :color, :pos, :board

  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  def slide_legal?(start, finish)
    return false unless start == pos
    @board.on_board?(finish) && @board.get_piece(finish).nil?
  end

  def landing_spot_legal?(finish)
    return false unless @board.get_piece(finish).nil? && @board.on_board?(finish)
  end

  def mid_spot_legal?(finish)
    cur_x, cur_y = @pos
    mid_x = (cur_x + finish[0]) / 2
    mid_y = (cur_y + finish[1]) / 2
    mid_spot = [midx_, mid_y]
    self.color != @board.get_piece(mid_spot).color
  end

  def jump_legal?(start, finish)
    return false unless start == @pos
    cur_x, cur_y = @pos
    @color == :B ? x = 1, x = -1
    dx, dy = finish[0] - start



  def slide_set
    cur_x, cur_y = @pos
    @color == :B ? x = 1 : x = -1
    moves = [[x,1], [x,-1]]
    pos_moves = []
    moves.each do |dx, dy|
      pos_move = [cur_x + dx, cur_y + dy]
      pos_moves << pos_move if (slide_legal?(pos_move))
    end
    pos_moves
  end

  def jump_set
    cur_x, cury_y = @pos
    @color == :B ? x = 2 : x = -2
    moves = [[x,2], [x,-2]]
    pos_moves = []
    moves.each do |dx, dy|
      pos_move = [cur_x + dx, cur_y + dy]
      pos_moves << pos_move if (jump_legal?(pos_move))
    end
    pos_moves
  end



end

class King
  attr_accessor :color
end

class Board
  attr_accessor :matrix

  def initialize
    @matrix = Array.new(8) {Array.new(8,nil)}
    set_up_colors(:R)
    set_up_colors(:B)
  end

  def on_board?(pos)
    (0..7).include?(pos[0]) && (0..7).include?(pos[1])
  end

  def get_piece(pos)
    x, y = pos
    @matrix[x][y]
  end

  #reds go on the bottom of the board, blacks on top
  def set_up_colors(color)
    color == :R ? x = 5 : x = 0
    (x..x+2).each do |x|
      (0..7).each do |y|
        if x % 2 == 1
          @matrix[x][y] = Piece.new(color, [x,y], self) if (y % 2 == 0)
        else
          @matrix[x][y] = Piece.new(color, [x,y], self ) if (y % 2 == 1)
        end
      end
    end
  end

  def display_row(row)
    row.each do |sq|
      print "  " if sq.nil?
      print " #{sq.color}" if sq
    end
    nil
  end

  def display
    (0..7).each do |row|
      print "#{row}: "
      display_row(@matrix[row])
      puts
    end
    nil
  end


end