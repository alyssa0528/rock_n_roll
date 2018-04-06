class RockNRoll::CLI

  def call
    puts "~~~~~Welcome to the Rock 'n' Roll 2018-19 races!~~~~~"
    sleep(1)
    RockNRoll::Scraper.new.create_races
    show_list
    menu
  end

  def show_list
    @races = RockNRoll::Race.all
    @races.each.with_index(1) do |race, index|
      puts "#{index}. #{race.location}"
    end
  end

  def menu
    input = nil
      puts "Enter the number of the race you'd like more information about. Alternatively, type 'list' to see the full list of races, or type 'exit':"
      while input != "exit"
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i <= RockNRoll::Race.all.length
        race = RockNRoll::Race.retrieve(input.to_i)
        show_details(race)
        puts ""
        puts "Enter another number to see race details. Type 'list' to see the full list or 'exit':"
      elsif input == "list"
        show_list
      elsif input == "exit"
        exit_program
      else
        puts "Sorry, please enter a valid number or type 'list' or 'exit':"
      end
    end
  end

  def show_details(race)
    if race.location != "TBD"
      puts "~*~*~*~*~*~*~* Details for #{race.location} ~*~*~*~*~*~*~*"
      puts "Date(s):              #{race.date}"
      puts "Distance(s):          #{race.distances}"
      puts "Description:          #{race.description}"
      puts "Event Hashtag:        #{race.hashtag}"
      puts "Event URL:            #{race.url}"
    else
      puts "Check back again soon for more details for this race!"
    end 
  end

  def exit_program
    puts "Thanks for checking, and keep on training!"
  end

end
