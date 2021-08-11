class Player
  attr_accessor :x, :y, :hp

  def initialize
    @x = 0
    @y = 0
    @hp = 100
  end

  def serialize
    {x: x, y: y, hp: hp}
  end

  def to_s
    "#{serialize}"
  end
end
