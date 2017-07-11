module SteppablePiece

  # def moves(current_pos, deltas)
  #   positions = []
  #   deltas.each do |pos|
  #     inner = []
  #     current_pos.each_with_index do |el, i|
  #       new_pos = el + pos[i]
  #       inner << new_pos unless new_pos < 0 || new_pos > 7
  #     end
  #     positions << inner
  #   end
  #   positions.select { |el| el.count == 2 }
  # end


  def moves(current_pos, deltas)
    new_positions = []
    deltas.each do |add_to_current|
      merged_coord = [add_to_current] + [current_pos]
      new_xy = merged_coord.transpose.map! { |el| el.inject(:+) }
      new_positions << new_xy unless new_xy.any? { |coord| coord < 0 || coord > 7}
    end
    new_positions
  end

end
