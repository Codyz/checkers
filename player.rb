require_relative "board"

class Player
  attr_accessor :color, :board

  def initialize(color)
    @color = color
  end

  # check if the piece on a square belongs to you. The game class or board (haven't decided yet) won't allow him to move it if the colors don't match.
  def your_piece(sq)
    piece = @board.get_piece(sq)
    piece.color == self.color
  end

