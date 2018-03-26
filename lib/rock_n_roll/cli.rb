class RockNRoll::CLI

  def call
    show_list
    menu
    show_details
  end

  def show_list #read more on here doc
    puts "Rock 'n' Roll Race Locations for 2018–2019:"
    puts "Luoping"
    puts "Carlsbad 5000"
  end

  def menu
    puts "Enter the number of the race you'd like more information about:"
  end

  def show_details
    puts "race date"
    puts "race distances"
    puts "race hashtag"
    puts "race social media links"
  end


end
