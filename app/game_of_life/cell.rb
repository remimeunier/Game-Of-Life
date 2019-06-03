# Parent class. Should not be initialize itself
class Cell
  attr_reader :world, :x, :y

  def initialize(args)
    @world = args.fetch(:world, '')
    @x     = args.fetch(:x, '')
    @y     = args.fetch(:y, '')
  end

  def neighbours_coordinates
    # Find all coordinates of neighbours
    # :Return: Array of array. The inside array is on this form [x,y]
    coordinates = [x - 1, x, x + 1].product([y - 1, y, y + 1])
    coordinates.delete([x, y])
    coordinates
  end

  private

  def alive_neighbours_count
    # Return all created neighbours cell
    neighbours.select { |cell| cell.is_a?(AliveCell) }.length
  end

  def neighbours
    # Return an array of cell
    neighbours_coordinates.map { |x, y| world.cell_at(x, y) }
  end
end
