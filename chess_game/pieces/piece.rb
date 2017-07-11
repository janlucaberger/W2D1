class Piece

  attr_accessor :value, :current_pos
  attr_reader :player

  def initialize(player, current_pos)
    @current_pos = current_pos
    @player = player
  end

end
