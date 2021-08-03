require_relative 'cursor'
require_relative 'tile'

class Map
  attr_accessor :cols
  attr_accessor :rows
  attr_accessor :cells
  attr_reader :blank_tile

  def initialize(rows, cols)
    @rows  = rows
    @cols  = cols
    @blank_tile = Tile.new('?')
    @cells = Array.new(rows) { Array.new(cols, @blank_tile) }
  end
  
  def cell(position)
    @cells[position.row][position.col]
  end

  def set(position, tile)
    puts "set: #{tile} - #{position}"
    @cells[position.row][position.col] = tile
  end

  def set_nearby(cursor, nearby, direction)
    if cursor.is_start_position?
      nearby[direction] = @blank_tile
    else
      nearby[direction] = cell(cursor.position)
    end
  end
  
  def nearby(position)
    cursor = Cursor.new(position, @rows, @cols)
    nearby = {}

    cursor.n
    set_nearby(cursor, nearby, :n)

    cursor.ne
    set_nearby(cursor, nearby, :ne)

    cursor.e
    set_nearby(cursor, nearby, :e)

    cursor.se
    set_nearby(cursor, nearby, :se)

    cursor.s
    set_nearby(cursor, nearby, :s)

    cursor.sw
    set_nearby(cursor, nearby, :sw)

    cursor.w
    set_nearby(cursor, nearby, :w)

    cursor.nw
    set_nearby(cursor, nearby, :nw)

    nearby
  end

  def nearby?(position, tile)
    nearby(position).include?(tile.display)
  end
end
