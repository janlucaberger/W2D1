require_relative 'piece'

class Queen < Piece
  def initialize(player, current_pos, board)
    super(player, current_pos)
    @board = board
    @value = (player == 1 ? "\u2655" : "\u265B"  )
  end
end
