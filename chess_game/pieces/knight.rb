require_relative 'piece'
require_relative 'steppable_pieces_module'

DELTAS = [
  [-2, 1],
  [-1, 2],
  [1, 2],
  [2, 1],
  [2, -1],
  [1, -2],
  [-1, -2],
  [-2, -1]
]

class Knight < Piece
  include SteppablePiece

  attr_reader :available_moves

  def initialize(player, current_pos)
    super
    @value = (player == 1 ? "\u2658" : "\u265E"  )
    @available_moves = moves(current_pos, DELTAS)
  end
end
