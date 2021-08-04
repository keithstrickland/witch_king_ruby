#!/usr/bin/env ruby

# require 'colorize'
require 'pastel'
require_relative 'map'
require_relative 'tile'
require_relative 'witch_king'

ROWS = ARGV[0].to_i || 32
COLS = ARGV[1].to_i || 32

# World map
$world = Map.new(ROWS, COLS)
$pastel = Pastel.new

# Terrain tiles
# $forest     = Tile.new('  '.green).freeze
# $mountain   = Tile.new('MM'.light_black).freeze
# $water      = Tile.new('OO'.blue).freeze
# $sanctuary  = Tile.new('SS'.white).freeze
# $town       = Tile.new('TT'.yellow).freeze
# $witch_king = Tile.new('WK'.magenta).freeze

$forest     = Tile.new($pastel.on_green('  ')).freeze
$mountain   = Tile.new($pastel.on_red('  ')).freeze
$water      = Tile.new($pastel.on_blue('  ')).freeze
$sanctuary  = Tile.new($pastel.on_bright_white('  ')).freeze
$town       = Tile.new($pastel.on_bright_yellow('  ')).freeze
$witch_king = Tile.new($pastel.on_magenta('WK')).freeze

# $forest     = Tile.new('.'.green).freeze
# $mountain   = Tile.new('M'.light_black).freeze
# $water      = Tile.new('O'.blue).freeze
# $sanctuary  = Tile.new('S'.white).freeze
# $town       = Tile.new('T'.yellow).freeze
# $witch_king = Tile.new('W'.magenta).freeze

# $forest     = Tile.new('.').freeze
# $mountain   = Tile.new('M').freeze
# $water      = Tile.new('O').freeze
# $sanctuary  = Tile.new('S').freeze
# $town       = Tile.new('T').freeze
# $witch_king = Tile.new('W').freeze

def gen_building
   num = rand(6) + 1
   case num
   when 1..5
     $sanctuary
   when 6
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
  when 2..5
    gen_special
  when 6..16
    $forest
  when 17..18
    gen_building
  end  
end

def continue?(chance)
  num = rand(100) + 1
  num <= chance
end

def mountain_continue(position)
  nearby = $world.nearby(position)
  if nearby[:n] == $mountain
    continue?(30)
  else
    false
  end
end

def water_continue(position)
  nearby = $world.nearby(position)
  if nearby[:n] == $water
    continue?(30)
  else
    false
  end
end

def print_map
  ROWS.times do |i|
    COLS.times do |j|
      print $world.cell(Position.new(i,j))
    end
    puts
  end
end

# First pass
puts "First pass..."
ROWS.times do |i|
  COLS.times do |j|
    position = Position.new(i, j)
    # puts "generating #{position} tile"
    $world.set(position, gen_tile)
  end
end

# puts
# print_map

# Second pass - fill in
puts "Second pass..."
ROWS.times do |i|
  COLS.times do |j|
    position = Position.new(i, j)
    current_tile = $world.cell(position)
    if current_tile == $forest
      # puts "Second pass forest..."
      if $world.nearby?(position, $mountain)
        # puts "Checking mountain add..."
        $world.set(position, $mountain) if continue?(15)
      elsif $world.nearby?(position, $water)
        $world.set(position, $water) if continue?(10)
      end
    end
  end
end

WitchKing.new.add_to($world, ROWS, COLS)

puts
print_map
