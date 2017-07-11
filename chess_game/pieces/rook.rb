require_relative 'piece'
require_relative 'sliding_pieces_module'

# class Rook < Piece
#   include SlidingPiece
#
#   attr_accessor :available_moves, :current_pos
#
#   def initialize(player, current_pos)
#     super(player, current_pos)
#     @board = []
#     @value = (player == 1 ? "\u2656" : "\u265C"  )
#
#   end
# end



class Rook < Piece
  include SlidingPiece

  attr_accessor :current_pos, :available_moves

    def initialize(player, current_pos, brd)
      super(player, current_pos)
      @board = brd.board
      @value = (player == 1 ? "\u2655" : "\u265B"  )
      @available_moves = horizontal_moves(current_pos, @board, player)
    end
end

#
# load 'board.rb'
# brd = Board.new
# brd.parse_pieces
