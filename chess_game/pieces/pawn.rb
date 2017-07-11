require_relative 'piece'

class Pawn < Piece
  def initialize(player, current_pos)
    super
    @value = (player == 1 ? "\u2659" : "\u265F"  )
  end
end
