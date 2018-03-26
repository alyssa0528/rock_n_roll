class RockNRoll::Race
  attr_accessor :location, :url, :date, :distances, :hashtag, :twitter, :facebook, :instagram


#@race = []

#  def initialize
#  end

  def self.all
    #puts <<-DOC.gsub /^\s*/, ''
    #Rock 'n' Roll Race Locations for 2018–2019:
    #1. Luoping
    #2. Carlsbad 5000
    #DOC
    race_1 = self.new
    race_1.location = "Luoping"
    race_1.url = "http://www.runrocknroll.com/luoping/"
    race_1.date = "March 10, 2018"
    race_1.distances = "13.1, 5K, Happy Run"
    race_1.hashtag = "#RNRLUOPING"
    race_1.twitter = "https://twitter.com/runrocknroll"
    race_1.facebook = "http://www.runrocknroll.com/luoping/"
    race_1.instagram = "http://instagram.com/runrocknroll"

    race_2 = self.new
    race_2.location = "Carlsbad 5000"
    race_2.url = "http://www.runrocknroll.com/carlsbad-5000/"
    race_2.date = "March 24-25, 2018"
    race_2.distances = "5K, All Day 20K, Jr CB"
    race_2.hashtag = "#CARLSBAD5000"
    race_2.twitter = "https://twitter.com/runrocknroll"
    race_2.facebook = "https://www.facebook.com/runrocknroll"
    race_2.instagram = "http://instagram.com/runrocknroll"

    [race_1, race_2]
#    @@race #returns all instances of Race
  end
end
