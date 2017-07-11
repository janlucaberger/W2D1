require_relative "steppable_pieces_module"
require_relative "../piece"
DELTAS = [
  [-1, -1],
  [-1, 0],
  [-1, 1],
  [0, -1],
  [0, 1],
  [1, -1],
  [1, 0],
  [1, 1]
]

class King < Piece
  include SteppablePiece

  def initialize(player, current_pos)
    super
    @value = (player == 1 ? "\u2654" : "\u265A"  )
    @available_moves = moves(current_pos, DELTAS)
  end

end
