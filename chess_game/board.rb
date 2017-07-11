require_relative "piece"



P1_PIECES = {
  Rook: [
    [0, 0],
    [0, 7]
  ],
  Knight: [
    [0, 1],
    [0, 6]
  ],
  Bishop: [
    [0, 2],
    [0, 5]
  ],
  Queen: [
    [0, 3]
  ],
  King: [
    [0,4]
  ],
  Pawn: [
    [1, 0],
    [1, 1],
    [1, 2],
    [1, 3],
    [1, 4],
    [1, 5],
    [1, 6],
    [1, 7]
  ]
}

P2_PIECES = {
  Rook: [
    [7, 0],
    [7, 7]
  ],
  Knight: [
    [7, 1],
    [7, 6]
  ],
  Bishop: [
    [7, 2],
    [7, 5]
  ],
  Queen: [
    [7, 3]
  ],
  King: [
    [7,4]
  ],
  Pawn: [
    [6, 0],
    [6, 1],
    [6, 2],
    [6, 3],
    [6, 4],
    [6, 5],
    [6, 6],
    [6, 7]
  ]
}

ALL_PIECES = [P1_PIECES, P2_PIECES]



class Board

  attr_accessor :board

  def initialize
    @board = Array.new(8) {Array.new(8) { NullPiece.instance }}
  end

  def populate_board
    # (0..@board.length - 1).each do |i|
    #   (0..@board.length - 1).each do |j|
    #     case i
    #     when 0, 1, 6, 7
    #       @board[i][j] = Piece.new('X', [i, j])
    #     else
    #       @board[i][j] = NullPiece.new('_', [i, j])
    #     end
    #   end
    # end
  end

  def parse_pieces
   player_val = 1
   ALL_PIECES.each do |player_pieces|
     player_pieces.each do |piece, all_pos|
       all_pos.each do |position|
         @board[position[0]][position[1]] = generate_piece(piece, player_val, position)
       end
     end
     player_val += 1
   end
 end

 def generate_piece(sym, player, position)
   case sym
   when :Rook
     # puts "Create Rook #{player} #{position}"
     Rook.new(player, position)
   when :Knight
     # puts "Create Knight #{player} #{position}"
     Knight.new(player, position)
   when :Bishop
     # puts "Create Bishop #{player} #{position}"
     Bishop.new(player, position)
   when :Queen
     # puts "Create Queen #{player} #{position}"
     Queen.new(player, position)
   when :King
     # puts "Create King #{player} #{position}"
     King.new(player, position)
   when :Pawn
     # puts "Create Pawn #{player} #{position}"
     Pawn.new(player, position)
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
