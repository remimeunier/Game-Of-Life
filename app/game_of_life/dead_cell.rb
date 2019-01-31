require './app/game_of_life/cell'
require './app/utils/constants_rules'

# Dead Cell class representation
class DeadCell < Cell
  def evolve
    # Return itself if not ready reproduce
    # and will return an alive cell if ready
    # Note : We could delete dead cell without alive neighbours,
    #        but I want to keep in memory 'known' univer
    ready_to_reproduce? ? AliveCell.new(world: @world, x: @x, y: @y) : self
  end

  private

  def ready_to_reproduce?
    alive_neighbours_count == BORN_EXACT_NEIGHBOURS
  end
end
