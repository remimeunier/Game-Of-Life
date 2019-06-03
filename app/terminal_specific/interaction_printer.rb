require './app/terminal_specific/world_printer'

module InteractionPrinter

  def self.print_interaction(text, posible_answer, clear=true)
    system 'clear' if clear
    puts(text)
    if posible_answer
      get_input(posible_answer)
    end
  end

  def self.print_iteration(world, iteration)
    system 'clear'
    puts("state :#{iteration} : ")
    puts('-----------------------------------')
    WorldPrinter.new(world).print_grid
    puts('-----------------------------------')
    puts('Press enter to go next iteration, q to stop the game')
    get_input(/\A\z/)
  end

  private

  def self.get_input(posible_answer)
    # Get the input value without the \n
    input = gets.gsub("\n", '')
    # Nicely quite if needed
    if input == "q" or input == "Q" or input == "quite" or input == "QUITE"
      quit
    end
    # Ask again if the input doesn't match a regex value
    unless posible_answer.match(input)
      puts("Wrong input ! Try again :")
      get_input(posible_answer)
    end
    input
  end

  def self.quit
    puts("Bye Bye !")
    exit
  end
end
