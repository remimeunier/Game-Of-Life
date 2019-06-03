require './app/terminal_specific/world_factory'
require './app/terminal_specific/interaction_printer'

world = WorldFactory.create_world

0.step do |i|
  InteractionPrinter.print_iteration(world, i)
  world.next_generation
end
