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
    @blank_tile = Tile.new('?', 0)
    @cells = Array.new(rows) { Array.new(cols, @blank_tile) }
  end
  
  def cell(position)
    @cells[position.row][position.col]
  end

  def set(position, tile)
    @cells[position.row][position.col] = tile
  end
  
  def nearby(position)
    cursor = Cursor.new(position, @rows, @cols)
    nearby = []

    cursor.n
    nearby << cell(cursor.position) unless cursor.is_start_position?

    cursor.ne
    nearby << cell(cursor.position) unless cursor.is_start_position?

    cursor.e
    nearby << cell(cursor.position) unless cursor.is_start_position?

    cursor.se
    nearby << cell(cursor.position) unless cursor.is_start_position?

    cursor.s
    nearby << cell(cursor.position) unless cursor.is_start_position?

    cursor.sw
    nearby << cell(cursor.position) unless cursor.is_start_position?

    cursor.w
    nearby << cell(cursor.position) unless cursor.is_start_position?

    cursor.nw
    nearby << cell(cursor.position) unless cursor.is_start_position?

    nearby
  end

  def nearby?(position, tile)
    nearby(position).include?(tile.display)
  end
end
