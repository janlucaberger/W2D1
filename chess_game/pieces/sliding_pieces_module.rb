module SlidingPiece

  def horizontal_moves(current_pos, board, player)
    -y = current_pos[1] - 1
    +y = current_pos[1] + 1
    x_pos = current_pos[0]

    i = 1
    x_pos = current_pos[0]
    y_pos = current_pos[1]


    available_moves = []

    while board[x_pos][y_pos_l].is_a?(NullPiece)
      break if y_pos_l < 0
      available_moves << [x_pos, y_pos_l]
      if board[x_pos][y_pos_l - 1].is_a?(NullPiece) == false
        break unless board.in_bounds?([x_pos, y_pos_l - 1])
        available_moves << [x_pos, y_pos_l - 1] unless board[x_pos][y_pos_l - 1].player == player
        break
      end
      y_pos_l -= 1
    end

    while board[x_pos][y_pos_r].is_a?(NullPiece)
      break if y_pos_l > 7
      available_moves << [x_pos, y_pos_r]
      if board[x_pos][y_pos_r + 1].is_a?(NullPiece) == false
        break unless board.in_bounds?([x_pos, y_pos_r + 1])
        available_moves << [x_pos, y_pos_r + 1] unless board[x_pos][y_pos_r + 1].player == player
        break
      end
      y_pos_r += 1
    end
#
    available_moves
  end

end
