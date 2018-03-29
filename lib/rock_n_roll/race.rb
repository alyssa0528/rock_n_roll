class RockNRoll::Race
  attr_accessor :location, :url, :date, :distances, :description, :hashtag

  #@@all stores all instances of race
  @@all = []

  def initialize(location = nil, url = nil, date = nil, distances = nil, description = nil, hashtag = nil) #twitter = nil, facebook = nil, instagram = nil)
    @location = location
    @url = url
    @date = date
    @distances = distances
    @description = description
    @hashtag = hashtag
    #@twitter = twitter
    #@facebook = facebook
    #@instagram = instagram
    @@all << self
  end

  def self.all
    @@all
  end

  def self.retrieve(input)
    self.all[input.to_i - 1] #takes user's input, subtracts 1, and uses that value as the index to retrieve from @@all
  end

end
