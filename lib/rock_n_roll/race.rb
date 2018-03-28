class RockNRoll::Race
  attr_accessor :location, :url, :date, :distances, :hashtag, :twitter, :facebook, :instagram

  #@@all stores all instances of race
  @@all = []

  def initialize(location = nil, url = nil, date = nil, distances = nil, hashtag = nil, twitter = nil, facebook = nil, instagram = nil)
    @location = location 
    @url = url 
    @date = date
    @distances = distances 
    @hashtag = hashtag 
    @twitter = twitter
    @facebook = facebook 
    @instagram = instagram
    @@all << self 
  end 

  def save
    @@all << self
  end

  def self.all
    @@all
  end

end
