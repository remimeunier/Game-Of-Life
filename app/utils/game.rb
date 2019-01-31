require './app/utils/basic_patterns'
require './app/game_of_life/world'
require './app/utils/printer'

class Game

  def self.game!
    starting_pattern = initilize_game
    start_game(World.new(starting_position: starting_pattern))
  end

  private

  def self.initilize_game
    system 'clear'
    puts('HOURA ! Welcome to the Game of Life')
    puts('You need to choose a starting position(s), I build some pattern for you :')
    puts('')
    BASIC_PATTERNS_DISPLAY.each do |type|
      puts("#{type[0]} : ")
      type[1].each do |pattern|
        puts("      #{pattern[:name]}   (code : #{pattern[:code]})")
      end
    end
    starting_pattern = []
    loop do
      starting_pattern += choose_pattern
      world = World.new(starting_position: starting_pattern.uniq)
      continue = initial_pattern(world)
      break unless continue == "Y\n"  or continue == "y\n"
    end
    starting_pattern.uniq
  end

  def self.choose_pattern
    puts('')
    puts('enter the pattern code :')
    pattern_input = gets
    choosen = ALL_PATTERNS.find { |p| p[:code] == pattern_input.to_i }
    puts("You choose a #{choosen[:name]}. Now choose a string position (format x,y, ex: 1,1) :")
    pattern_postion = gets
    start_x = pattern_postion.split(',')[0].to_i
    start_y = pattern_postion.split(',')[1].to_i
    choosen[:form].map { |x, y| [start_x + x, start_y + y] }
  end

  def self.initial_pattern(world)
    puts('It looks like this :')
    puts('-----------------------------------')
    Printer.new(world).print_grid
    puts('-----------------------------------')
    puts('Want to add an other pattern : (Y/N) : ')
    gets
  end

  def self.start_game(world)
    system "clear"
    puts('initial state :')
    puts('-----------------------------------')
    Printer.new(world).print_grid
    puts('-----------------------------------')
    puts('Press enter to go next iteration, cmd+c to stop the game')
    gets
    start_next_iteration(world, 1)
  end

  def self.start_next_iteration(world, iteration)
    world.next_generation
    system 'clear'
    puts("state :#{iteration} : ")
    puts('-----------------------------------')
    Printer.new(world).print_grid
    puts('-----------------------------------')
    puts('Press enter to go next iteration, cmd+c to stop the game')
    gets
    start_next_iteration(world, iteration+1)
  end

end
