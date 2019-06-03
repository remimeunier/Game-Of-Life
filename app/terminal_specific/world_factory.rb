require './app/utils/basic_patterns'
require './app/game_of_life/world'
require './app/terminal_specific/world_printer'
require './app/terminal_specific/interaction_printer'

module WorldFactory

  def self.create_world
    starting_pattern = initilize_game
    World.new(starting_position: starting_pattern)
  end

  private

  def self.initilize_game
    text = "HOURA ! Welcome to the Game of Life\nYou need to choose a starting position(s), I build some pattern for you :\n\n"
    BASIC_PATTERNS_DISPLAY.each do |type|
      text = text + "#{type[0]} : \n"
      type[1].each do |pattern|
        text = text + "      #{pattern[:name]}   (code : #{pattern[:code]})\n"
      end
    end
    InteractionPrinter.print_interaction(text, false)
    starting_pattern = []
    loop do
      starting_pattern += choose_pattern
      world = World.new(starting_position: starting_pattern.uniq)
      continue = initial_pattern(world)
      break unless continue == "Y" or continue == "y"
    end
    starting_pattern.uniq
  end

  def self.choose_pattern
    pattern_input = InteractionPrinter.print_interaction("\nEnter the pattern code : \n", /\A^(1[0-3]|[1-9])$\z/, false)
    choosen = ALL_PATTERNS.find { |p| p[:code] == pattern_input.to_i }

    pattern_postion = InteractionPrinter.print_interaction(
      "You choose a #{choosen[:name]}. Now choose a string position (format x,y, ex: 1,1) :",
      /\A(-?[0-9])\,(-?[0-9])\z/,
      false)
    start_x = pattern_postion.split(',')[0].to_i
    start_y = pattern_postion.split(',')[1].to_i
    choosen[:form].map { |x, y| [start_x + x, start_y + y] }
  end

  def self.initial_pattern(world)
    InteractionPrinter.print_interaction("It looks like this :\n-----------------------------------", false, false)
    WorldPrinter.new(world).print_grid
    InteractionPrinter.print_interaction("-----------------------------------\nWant to add an other pattern : (Y/N) : ",
                                /\A(Y|y|N|n)\z/,
                                false)
  end
end
