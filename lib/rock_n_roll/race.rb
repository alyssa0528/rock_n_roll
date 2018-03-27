class RockNRoll::Race
  attr_accessor :location, :url, :date, :distances, :hashtag, :twitter, :facebook, :instagram

  #@@all stores all instances of race
  @@all = []

  def save
    @@all << self
  end

  def self.all
    @@all
  end

end
