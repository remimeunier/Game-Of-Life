require './app/game_of_life/alive_cell'
require 'colorize'

class Printer

  attr_reader :grid
  def initialize(world)
    @cells = world.cells.sort_by { |cell| [cell.x, cell.y] }

    # quick sort to get greater and lower value of x and y
    sort_by_x = @cells.sort_by(&:x)
    sort_by_y = @cells.sort_by(&:y)

    # The game can have negativ value, but the printer no,
    # as values are saved inside an array
    @delta_x = negative_def_to_zero(sort_by_x[0].x)
    @delta_y = negative_def_to_zero(sort_by_y[0].y)

    # Calculte the number of rows and cols (+1 for position 0)
    rows_diff = sort_by_y[-1].y - sort_by_y[0].y
    cols_diff = sort_by_x[-1].x - sort_by_x[0].x
    rows = greater_diff_to_zero(sort_by_y[-1].y, sort_by_y[0].y, rows_diff) + 1
    cols = greater_diff_to_zero(sort_by_x[-1].x, sort_by_x[0].x, cols_diff) + 1

    @grid = build_grid(rows, cols)
  end

  # print a red X for alive value
  def print_grid
    @grid.each do |row|
      row.each do |cell|
        if cell == 'X'
          print(cell.red)
        else
          print(cell)
        end
      end
      print("\n")
    end
  end

  private

  def negative_def_to_zero(number)
    number < 0 ? -number : 0
  end

  def greater_diff_to_zero(number1, number2, number3)
    positif1 = number1 < 0 ? -number1 : number1
    positif2 = number2 < 0 ? -number2 : number2
    positif3 = number3 < 0 ? -number3 : number3
    [positif1, positif2, positif3].max
  end

  def build_grid(rows, cols)
    grid = Array.new(rows) { Array.new(cols, 'O') }

    # Only print Alive value
    alive_cells = @cells.select { |cell| cell.is_a?(AliveCell) }
    alive_cells.each do |cell|
      grid[@delta_y + cell.y][@delta_x + cell.x] = 'X'
    end
    grid
  end
end
