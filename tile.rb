class Tile
  attr_accessor :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def to_s
    display
  end

  def display
    @symbol
  end

  def ==(other)
    @symbol == other.symbol
  end
end
