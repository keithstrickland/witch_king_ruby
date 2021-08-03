require_relative 'position'

class PositionOffset

  attr_accessor :start_position
  attr_accessor :offset_position

  def initialize(initial_position)
    @start_position  = Position.new(initial_position.row, initial_position.col)
    @offset_position = Position.new(initial_position.row, initial_position.col)
  end

  def reset
    @offset_position = Position.new(@start_position.row, @start_position.col)
  end

  def is_start_position?
    @offset_position == @start_position
  end

  def n
    reset
    dec_row
  end

  def ne
    reset
    dec_row
    inc_col
  end

  def e
    reset
    inc_col
  end

  def se
    reset
    inc_row
    inc_col
  end

  def s
    reset
    inc_row
  end

  def sw
    reset
    inc_row
    dec_col
  end

  def w
    reset
    dec_col
  end

  def nw
    reset
    dec_row
    dec_col
  end

  private

  def dec_row
    @offset_position.row = @start_position.row - 1
  end

  def inc_row
    @offset_position.row = @start_position.row + 1
  end

  def dec_col
    @offset_position.col = @start_position.col - 1
  end

  def inc_col
    @offset_position.col = @start_position.col + 1
  end
end
