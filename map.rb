require_relative 'position_offset'
require_relative 'tile'

class Map
  attr_accessor :cols
  attr_accessor :rows
  attr_accessor :cells
  attr_reader :blank_tile
  attr_reader :quadrant

  def initialize(rows, cols)
    @rows  = rows
    @cols  = cols
    @blank_tile = Tile.new(' ')
    @cells = Array.new(rows) { Array.new(cols) }
    init_quadrants
  end

  def init_quadrants
    @quadrant = []
    @quadrant[1] = { row_start: 0, row_end: @rows/2 - 1, col_start: 0, col_end: @cols/2 - 1}
    @quadrant[2] = { row_start: 0, row_end: @rows/2 - 1, col_start: @cols/2, col_end: @cols - 1 }
    @quadrant[3] = { row_start: @rows/2, row_end: @rows - 1, col_start: 0, col_end: @cols/2 - 1 }
    @quadrant[4] = { row_start: @rows/2, row_end: @rows - 1, col_start: @cols/2, col_end: @cols - 1 }
  end

  def quadrant_contents(quadrant_num)
    quadrant_extants = @quadrant[quadrant_num]
    quadrant_contents = []
    (quadrant_extants[:row_start]..quadrant_extants[:row_end]).each do |i|
      (quadrant_extants[:col_start]..quadrant_extants[:col_end]).each do |j|
        # puts "#{i}, #{j}"
        quadrant_contents << cell(Position.new(i,j))
      end
    end

    quadrant_contents
  end

  def out_of_bounds(position)
    position.row == -1 || position.col == -1 || position.row == rows || position.col == cols
  end

  def cell(position)
    if out_of_bounds position
      @blank_tile
    else
      @cells[position.row][position.col]
    end
  end

  def set(position, tile)
    @cells[position.row][position.col] = tile
  end

  def set_nearby(cursor, nearby, direction)
    nearby[direction] = cell(cursor.offset_position)
  end
  
  def nearby(position)
    offset = PositionOffset.new(position)
    nearby = {}

    offset.n
    set_nearby(offset, nearby, :n)

    offset.ne
    set_nearby(offset, nearby, :ne)

    offset.e
    set_nearby(offset, nearby, :e)

    offset.se
    set_nearby(offset, nearby, :se)

    offset.s
    set_nearby(offset, nearby, :s)

    offset.sw
    set_nearby(offset, nearby, :sw)

    offset.w
    set_nearby(offset, nearby, :w)

    offset.nw
    set_nearby(offset, nearby, :nw)

    nearby
  end

  def nearby?(position, tile)
    nearby(position).values.to_a.include?(tile)
  end
end
