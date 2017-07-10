require 'byebug'

module SlidingPiece
  def moves(sym)
    case sym
    when horizontal
    when vertical
    when both
    end
  end
end



class Piece

  attr_accessor :value

  def initialize(value, current_pos)
    debugger
    @current_pos = current_pos
    @value = value
  end

  def moves

  end

end


class NullPiece < Piece
  # 
  # def initialize(value, current_pos)
  #   super(value, current_pos)
  # end

end
