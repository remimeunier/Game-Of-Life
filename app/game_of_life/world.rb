require './app/game_of_life/dead_cell'
require './app/game_of_life/alive_cell'

# World Representation, it saved all known cell in an array
# Is initialize with an array of position. This position will
# the the initial alive cells
class World
  attr_reader :cells

  def initialize(args)
    @cells = []
    args.fetch(:starting_position, []).each do |x, y|
      @cells << AliveCell.new(x: x, y: y, world: self)
    end
    pre_processing
  end

  def cell_at(x, y)
    # Return the cell at x,y if it exists, nill if not
    @cells.find { |cell| cell.x == x && cell.y == y }
  end

  def next_generation
    pre_processing
    @cells = @cells.map(&:evolve)
  end

  private

  def pre_processing
    # Create dead cells next to alive one
    # as they are suceptible to get alive
    position = []
    @cells.select { |cell| cell.is_a?(AliveCell) }.each do |cell|
      position += cell.neighbours_coordinates
    end
    position.uniq.each do |x, y|
      add_dead_cell(x, y) unless cell_at(x, y)
    end
  end

  def add_dead_cell(x, y)
    @cells << DeadCell.new(x: x, y: y, world: self)
  end
end
