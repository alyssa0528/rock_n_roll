class RockNRoll::CLI

  def call
    show_list
    menu
    #show_details
    exit_program
  end

  def show_list #read more on here doc
    puts <<-DOC.gsub /^\s*/, ''
    Rock 'n' Roll Race Locations for 2018–2019:
    1. Luoping
    2. Carlsbad 5000
    DOC
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the race you'd like more information about. Alternatively, type 'list' to see the full list of races, or type exit:"
      input = gets.strip.downcase
    case input
    when "1"
      puts "race details on race 1"
    when "2"
      puts "race details on race 2"
    when "list"
      show_list
    else
      puts "Sorry, please enter a valid number or type 'list' or 'exit':"
    end
    end
  end

  #def show_details
  #  puts "race date"
  #  puts "race distances"
  #  puts "race hashtag"
  #  puts "race social media links"
  #end

  def exit_program
    puts "Thanks for checking, and keep training!"
  end

end
