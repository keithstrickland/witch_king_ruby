require_relative 'position'

class Cursor

  attr_accessor :position
  attr_accessor :row_max
  attr_accessor :col_max

  def initialize(initial_position, rows, cols)
    @position = initial_position
    @start_row = initial_position.row
    @start_col = initial_position.col
    @row_max = rows - 1
    @col_max = cols - 1
  end
  
  def eql?(position)
    @position.row == position.row && @position.col == position.col
  end

  def is_start_position?
    @position.row == @start_row && @position.col == @start_col
  end

  def set(row, col)
    @position.row = row
    @position.col = col
  end

  def n
    dec_row
  end

  def ne
    dec_row
    inc_col
  end

  def e
    inc_col
  end

  def se
    inc_row
    inc_col
  end

  def s
    inc_row
  end

  def sw
    inc_row
    dec_col
  end

  def w
    dec_col
  end

  def nw
    dec_row
    dec_col
  end

  private

  def dec_row
    @position.row -= 1 unless @position.row == 0
  end

  def inc_row
    @position.row += 1 unless @position.row == @row_max
  end

  def dec_col
    @position.col -= 1 unless @position.col == 0
  end

  def inc_col
    @position.col += 1 unless @position.col == @col_max
  end
end
