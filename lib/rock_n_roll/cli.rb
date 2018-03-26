class RockNRoll::CLI

  def call
    show_list
    menu
    show_details
  end

  def show_list #read more on here doc
    puts <<-DOC.gsub /^\s*/, ''
    Rock 'n' Roll Race Locations for 2018–2019:
    1. Luoping
    2. Carlsbad 5000
    DOC
  end

  def menu
    puts "Enter the number of the race you'd like more information about:"
    input = gets.strip
    case input
    when "1"
      puts "race details on race 1"
    when "2"
      puts "race details on race 2"
    end 
  end

  def show_details
    puts "race date"
    puts "race distances"
    puts "race hashtag"
    puts "race social media links"
  end


end
