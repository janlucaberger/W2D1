require "colorize"
require_relative "board"
require_relative "cursor"

class Display

  def initialize(board, cursor_pos)
    @grid = board
    @cursor = Cursor.new([0,0], @grid)
    @cursor_pos = @cursor.cursor_pos
  end

  def test_render
    loop do
      system("clear")
      render
      @cursor.get_input
    end
  end

  def render
    brd = @grid.board
    (0..brd.length - 1).each do |row|
      (0..brd.length - 1).each do |col|
        if @cursor.cursor_pos == [row, col]
          print "#{@grid.board[row][col].value.colorize(:color => :white, :background => :light_black)} "
        else
          print "#{@grid.board[row][col].value.colorize(:color => :light_blue,)} "
        end
      end
      puts ""
    end
  end
end

if __FILE__ == $PROGRAM_NAME

  load 'display.rb'

  brd = Board.new
  brd.populate_board
  dsp = Display.new(brd, [0,0])
  dis.test_render
end
