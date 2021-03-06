class Position
  attr_accessor :row
  attr_accessor :col

  def initialize(row = 0, col = 0)
    @row = row
    @col = col
  end

  def eql?(row, col)
    @row == row && @col == col
  end

  def ==(other)
    @row == other.row && @col == other.col
  end

  def to_s
    "row: #{@row} col: #{@col}"
  end
end
