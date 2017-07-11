require 'singleton'
require_relative 'piece'

class NullPiece < Piece
  include Singleton

  def initialize#(value, current_pos)
    super(nil, nil)
    @value = "_"
  end

end
