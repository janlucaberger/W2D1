require_relative 'piece'

class Bishop < Piece
  def initialize(player, current_pos, board)
    super(player, current_pos)
    @board = board
    @value = (player == 1 ? "\u2657" : "\u265D"  )
  end
end
