class WitchKing

  def gen_wk_start_row(rows)
    rows/2
  end

  def gen_wk_start_column(cols)
    cols/2
  end

  def add_to(map, rows, cols)
    # Witch King Fortress
    puts "generating fortress"
    wk_start_row    = gen_wk_start_row(rows)
    wk_start_column = gen_wk_start_column(cols)

    map.set(Position.new(wk_start_row, wk_start_column), $witch_king)
    map.set(Position.new(wk_start_row + 1, wk_start_column), $witch_king)
    map.set(Position.new(wk_start_row + 1, wk_start_column + 1), $witch_king)
    map.set(Position.new(wk_start_row, wk_start_column + 1), $witch_king)

    # Only forest around Witch King Fortress
    puts "generating forest around fortress"
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