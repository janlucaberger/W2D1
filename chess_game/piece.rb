# require 'byebug'
require 'singleton'
require_relative "pieces/king"


class Piece

  attr_accessor :value

  def initialize(player, current_pos)
    @current_pos = current_pos
    @player = player
  end

end


class NullPiece < Piece
  include Singleton

  def initialize#(value, current_pos)
    super(nil, nil)
    @value = "_"
  end

end



class Queen < Piece
  def initialize(player, current_pos)
    super
    @value = (player == 1 ? "\u2655" : "\u265B"  )
  end
end

class Bishop < Piece
  def initialize(player, current_pos)
    super
    @value = (player == 1 ? "\u2657" : "\u265D"  )
  end
end

class Rook < Piece
  include SlidingPiece
  def initialize(player, current_pos)
    super
    @value = (player == 1 ? "\u2656" : "\u265C"  )
  end
end

class Pawn < Piece
  def initialize(player, current_pos)
    super
    @value = (player == 1 ? "\u2659" : "\u265F"  )
  end
end

class Knight < Piece
  def initialize(player, current_pos)
    super
    @value = (player == 1 ? "\u2658" : "\u265E"  )
  end
end
