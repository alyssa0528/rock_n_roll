class RockNRoll::CLI

  def call
    puts "~~~~~Welcome to the Rock 'n' Roll 2018-19 races!~~~~~"
    sleep(2)
    RockNRoll::Scraper.new.scrape_races
    show_list #
    menu
  end

  def show_list
    @races = RockNRoll::Race.all #@@all
    @races.each.with_index(1) do |race, index|
      puts "#{index}. #{race.location}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the race you'd like more information about. Alternatively, type 'list' to see the full list of races, or type 'exit':"
      input = gets.strip.downcase
      if input.to_i > 0
        show_list[input.to_i - 1]
      elsif input == "list"
        show_list
      elsif input == "exit"
        exit_program
      else
        puts "Sorry, please enter a valid number or type 'list' or 'exit':"
      end
    end
  end

  def show_details
    puts "race date"
    puts "race distances"
    puts "race hashtag"
    puts "race social media links"
  end

  def exit_program
    puts "Thanks for checking, and keep training!"
  end

end
