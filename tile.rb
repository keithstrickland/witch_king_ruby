class Tile
  attr_accessor :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def to_s
    @symbol
  end

  def inspect
    super
    @symbol
  end

  def ==(other)
    @symbol == other.symbol
  end
end
