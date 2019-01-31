require './app/game_of_life/cell'
require './app/utils/constants_rules'

# Alive Cell class representation
class AliveCell < Cell
  def evolve
    # Return itself if not ready to die
    # and will return an DeadCell if so
    ready_to_die ? DeadCell.new(world: @world, x: @x, y: @y) : self
  end

  private

  def ready_to_die
    alive_neighbours_count < DIE_FIEWER_NEIGHBOURS_THAN ||
      alive_neighbours_count > DIE_GREATER_NEIGHBOURS_THAN
  end
end
