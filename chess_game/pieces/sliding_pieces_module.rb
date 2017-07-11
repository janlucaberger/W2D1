module SlidingPiece

  def moves
    puts self.class == Rook
    case self.class.to_s
    when :Rook
      puts "I move horizontally and vertically"
    when :Queen
      puts "I move anywhere"
    when :Bishop
      puts "I move diagonally"
    end
  end

end
