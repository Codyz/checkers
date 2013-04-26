require_relative "piece"
require_relative "error"



class Board
  attr_accessor :matrix

  # initialization, retrieve pieces, and display methods

  def initialize
    @matrix = Array.new(8) {Array.new(8,nil)}
    set_up_colors(:R)
    set_up_colors(:B)
  end

  def on_board?(pos)
    (0..7).include?(pos[0]) && (0..7).include?(pos[1])
  end

  def set_piece(pos, piece)
    x, y = pos
    @matrix[x][y] = piece
    piece.pos = [x,y]
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


  # methods involving the manipulation of pieces on the board


  def slide_legal?(start, finish)
    return false if get_piece(start).nil?
    on_board?(finish) && get_piece(finish).nil?
  end

  def landing_spot_legal?(finish)
    return false unless get_piece(finish).nil? && on_board?(finish)
  end

  def mid_spot_legal?(start, finish)
    cur_x, cur_y = start
    piece = get_piece(start)
    mid_x = (cur_x + finish[0]) / 2
    mid_y = (cur_y + finish[1]) / 2
    mid_spot = [mid_x, mid_y]
    piece.color != get_piece(mid_spot).color
  end

  def jump_legal?(start, finish)
    return false if get_piece(start).nil?
    cur_x, cur_y = start
    piece = get_piece(start)
    piece.color == :B ? x = 2 : x = -2
    dx, dy = finish[0] - cur_x, finish[1] - cur_y
    correct_distance == (dx == x) && (dy == 2 || dy == -2)
    correct_distance && mid_spot_legal?(finish) && landing_spot_legal?(finish)
  end


  def perform_slide(start, finish)
    unless slide_legal?(start, finish)
      raise InvalidMoveError.new "You can't make that move!"
    end

    piece = get_piece(start)
    move_set = piece.slide_set

    unless move_set.include?(finish)
      raise InvalidMoveError.new "You can't make that move!"
    end

    set_piece(finish, piece)
    @matrix[start[0]][start[1]] = nil
  end

  def perform_jump(start, finish)




end