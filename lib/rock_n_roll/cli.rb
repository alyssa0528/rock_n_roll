class RockNRoll::CLI

  def call
    puts "~~~~~Welcome to the Rock 'n' Roll 2018-19 races!~~~~~"
    sleep(1)
    RockNRoll::Scraper.new.scrape_races
    show_list
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
        #Call RockNRoll::Race.all to pull up the @@all array, and from there, input.to_1 -1 will retrieve appropriate race details.
        #needs retrieve method
        #RockNRoll::Scraper.new.scrape_race_details[input.to_i - 1]
        race = RockNRoll::Race.retrieve(input.to_i)
        show_details(race)
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
    puts "~*~*~*~* Details for #{race.location} ~*~*~*~*"
    puts "Date(s):              #{race.date}"
    puts "Distance(s):          #{race.distances}"
    puts "Description:          #{race.description}"
    puts "Event Hashtag:        #{race.hashtag}"
    puts "Event URL:            #{race.url}"
  end

  def exit_program
    puts "Thanks for checking, and keep on training!"
  end

end
