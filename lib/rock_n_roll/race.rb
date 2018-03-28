class RockNRoll::Race
  attr_accessor :location, :url, :date, :distances, :hashtag, :twitter, :facebook, :instagram

  #@@all stores all instances of race
  @@all = []

  def initialize 
    @location = location 
    @url = url 
    @date = date
    @distances = distances 
    @hashtag = hashtag 
    @twitter = twitter
    @facebook = facebook 
    @instagram = instagram
  end 

  def save
    @@all << self
  end

  def self.all
    @@all
  end

end
