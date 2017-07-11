require_relative "pieces/pieces"

P1_PIECES = {
  Rook: [
    [0, 3]
  ]
  # Knight: [
  #   [0, 1],
  #   [0, 6]
  # ],
  # Bishop: [
  #   [0, 2],
  #   [0, 5]
  # ],
  # Queen: [
  #   [0, 3]
  # ],
  # King: [
  #   [0,4]
  # ],
  # Pawn: [
  #   [1, 0],
  #   [1, 1],
  #   [1, 2],
  #   [1, 3],
  #   [1, 4],
  #   [1, 5],
  #   [1, 6],
  #   [1, 7]
  # ]
}
# P1_PIECES = {
#   Rook: [
#     [0, 0],
#     [0, 7]
#   ],
#   Knight: [
#     [0, 1],
#     [0, 6]
#   ],
#   Bishop: [
#     [0, 2],
#     [0, 5]
#   ],
#   Queen: [
#     [0, 3]
#   ],
#   King: [
#     [0,4]
#   ],
#   Pawn: [
#     [1, 0],
#     [1, 1],
#     [1, 2],
#     [1, 3],
#     [1, 4],
#     [1, 5],
#     [1, 6],
#     [1, 7]
#   ]
# }

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

 def in_check?(player)
   king_pos = find_king(player)

 end

 def find_king(player)
   king_pos = []
   self.board.each do |row|
     row.each do |item|
       king_pos << item.current_pos if item.is_a?(King) && item.player == player
     end
   end
   king_pos
 end


 def generate_piece(sym, player, position)
   case sym
   when :Rook
     # puts "Create Rook #{player} #{position}"
     Rook.new(player, position, self)
   when :Knight
     # puts "Create Knight #{player} #{position}"
     Knight.new(player, position)
   when :Bishop
     # puts "Create Bishop #{player} #{position}"
     Bishop.new(player, position, self)
   when :Queen
     # puts "Create Queen #{player} #{position}"
     Queen.new(player, position, self)
   when :King
     # puts "Create King #{player} #{position}"
     King.new(player, position)
   when :Pawn
     # puts "Create Pawn #{player} #{position}"
     Pawn.new(player, position)
   end
 end

def render_board
  self.board.each do |row|
    row.each do |itm|
      puts "#{itm.class}"
    end
  end
end

  def move_piece(start_pos, end_pos)
    piece_to_move = self[start_pos]
    piece_to_kill = self[end_pos]
    raise ArgumentError.new("There is no piece at #{start_pos}") if piece_to_move.is_a?(NullPiece)
    raise ArgumentError.new("invalid move") unless piece_to_move.available_moves.include?(end_pos)
    # raise ArgumentError.new("Invalid move for #{piece_to_move} to #{end_pos}") unless .valid_move?(end_pos)
    raise ArgumentError.new("Thats your own piece!") if piece_to_move.player == piece_to_kill.player


    self[end_pos] = piece_to_move
    piece_to_move.current_pos = end_pos
    self[start_pos] = NullPiece.instance

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
  game.board
  game.in_check(1)


end
