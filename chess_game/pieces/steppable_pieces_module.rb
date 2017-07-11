module SteppablePiece

  def moves(current_pos, deltas)
    positions = []
    deltas.each do |pos|
      inner = []
      current_pos.each_with_index {|el, i| inner << el + pos[i]}
      positions << inner
    end
  end

end
