require_relative "piece"

class Board

  attr_accessor :board

  def initialize
    @board = Array.new(8) {Array.new(8)}
  end

  def populate_board
    (0..@board.length - 1).each do |i|
      (0..@board.length - 1).each do |j|
        case i
        when 0, 1, 6, 7
          @board[i][j] = Piece.new('X', [i, j])
        else
          @board[i][j] = NullPiece.new('_', [i, j])
        end
      end
    end
  end

  def move_piece(start_pos, end_pos)
    raise ArgumentError.new("There is no piece at #{start_pos}") if self[start_pos].is_a?(NullPiece)
    # raise ArgumentError.new("Invalid move for #{board(start_pos)} to #{end_pos}") unless self[start_pos].valid_move?(end_pos)
    null_piece = NullPiece.new("_")
    piece_to_move = self[start_pos]
    self[end_pos] = piece_to_move
    self[start_pos] = null_piece
  end

  def [](pos)
    row, col = pos
    self.board[row][col]
  end

  def []=(pos, target)
    row, col = pos
    self.board[row][col] = target
  end

  def in_bounds?(pos)
    pos.each { |x| return false if x < 0 || x > 7 }
    true
  end

end

if __FILE__ == $PROGRAM_NAME
  # load 'board.rb'
  game = Board.new
  game.populate_board
  game.move_piece([0,0], [4,4])
  game.board


end
