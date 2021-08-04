class WitchKing

  OFFSET_RANGE = 4

  def gen_wk_start_row(rows)
    offset = rand(OFFSET_RANGE)-2
    rows/2 + offset
  end

  def gen_wk_start_column(cols)
    offset = rand(OFFSET_RANGE)-2
    cols/2 + offset
  end

  def add_to(map, rows, cols)
    # Witch King Fortress
    # puts "generating fortress"
    wk_start_row    = gen_wk_start_row(rows)
    wk_start_column = gen_wk_start_column(cols)

    map.set(Position.new(wk_start_row, wk_start_column), $witch_king)
    map.set(Position.new(wk_start_row + 1, wk_start_column), $witch_king)
    map.set(Position.new(wk_start_row + 1, wk_start_column + 1), $witch_king)
    map.set(Position.new(wk_start_row, wk_start_column + 1), $witch_king)

    # Only forest around Witch King Fortress
    # puts "generating forest around fortress"
    map.set(Position.new(wk_start_row - 1, wk_start_column - 1), $forest)
    map.set(Position.new(wk_start_row - 1, wk_start_column), $forest)
    map.set(Position.new(wk_start_row - 1, wk_start_column + 1), $forest)
    map.set(Position.new(wk_start_row - 1, wk_start_column + 2), $forest)
    map.set(Position.new(wk_start_row, wk_start_column - 1), $forest)
    map.set(Position.new(wk_start_row, wk_start_column + 2), $forest)
    map.set(Position.new(wk_start_row + 1, wk_start_column - 1), $forest)
    map.set(Position.new(wk_start_row + 1, wk_start_column + 2), $forest)
    map.set(Position.new(wk_start_row + 2, wk_start_column - 1), $forest)
    map.set(Position.new(wk_start_row + 2, wk_start_column), $forest)
    map.set(Position.new(wk_start_row + 2, wk_start_column + 1), $forest)
    map.set(Position.new(wk_start_row + 2, wk_start_column + 2), $forest)
  end

end