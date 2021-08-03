#!/usr/bin/env ruby

require 'colorize'
require_relative 'map'
require_relative 'tile'

ROWS = ARGV[0].to_i || 32
COLS = ARGV[1].to_i || 32

$forest     = Tile.new('.'.green, 80)
$mountain   = Tile.new('M'.light_black, 50)
$water      = Tile.new('O'.blue, 20)
$sanctuary  = Tile.new('S'.white, 0)
$town       = Tile.new('T'.yellow, 0)
$witch_king = Tile.new('W'.magenta, 0)

def gen_building
   num = rand(6) + 1
   case num
   when 1..4
     $sanctuary
   when 5..6
     $town
   end   
end

def gen_special
  num = rand(6) + 1
  case num
  when 1..5
    $mountain
  when 6
    $water
  end  
end

def gen_tile
  num = rand(6) + rand(6) + rand(6) + 3
  case num
  when 2..13
    $forest
  when 14..16
    gen_special
  when 17..18
    gen_building
  end  
end

def extend_nearby_tile(position)
  tile_was_set = false
  $world.nearby(position).each do |tile|
    if !tile.nil? && tile.continue?
      $world.set(position, tile)
      tile_was_set = true
      puts "tile #{tile.display} extended"
    end
  end
  tile_was_set
end

$world = Map.new(ROWS, COLS)

ROWS.times do |i|
  COLS.times do |j|
    position = Position.new(i - 1, j - 1)
    $world.set(position, gen_tile) # unless extend_nearby_tile(position)
  end
end

wk_start_row    = ROWS/2
wk_start_column = COLS/2

# Witch King Fortress
$world.set(Position.new(wk_start_row, wk_start_column), $witch_king)
$world.set(Position.new(wk_start_row + 1, wk_start_column), $witch_king)
$world.set(Position.new(wk_start_row + 1, wk_start_column + 1), $witch_king)
$world.set(Position.new(wk_start_row, wk_start_column + 1), $witch_king)

# Only forest around Witch King Fortress
$world.set(Position.new(wk_start_row - 1, wk_start_column - 1), $forest)
$world.set(Position.new(wk_start_row - 1, wk_start_column), $forest)
$world.set(Position.new(wk_start_row - 1, wk_start_column + 1), $forest)
$world.set(Position.new(wk_start_row - 1, wk_start_column + 2), $forest)
$world.set(Position.new(wk_start_row, wk_start_column - 1), $forest)
$world.set(Position.new(wk_start_row, wk_start_column + 2), $forest)
$world.set(Position.new(wk_start_row + 1, wk_start_column - 1), $forest)
$world.set(Position.new(wk_start_row + 1, wk_start_column + 2), $forest)
$world.set(Position.new(wk_start_row + 2, wk_start_column - 1), $forest)
$world.set(Position.new(wk_start_row + 2, wk_start_column), $forest)
$world.set(Position.new(wk_start_row + 2, wk_start_column + 1), $forest)
$world.set(Position.new(wk_start_row + 2, wk_start_column + 2), $forest)

puts

ROWS.times do |i|
  COLS.times do |j|
    print $world.cell(Position.new(i,j)).display
  end
  puts
end
