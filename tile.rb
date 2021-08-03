class Tile
  attr_accessor :symbol,:continue

  def initialize(symbol, continue_chance)
    @symbol = symbol
    @continue = continue_chance
  end

  def continue?
    num = rand(100) + 1
    num <= @continue
  end

  def display
    @symbol
  end

  def ==(other)
    @symbol = other.symbol
  end
end
