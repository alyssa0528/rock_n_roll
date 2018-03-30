class RockNRoll::Race
  attr_accessor :location, :url, :date, :distances, :description, :hashtag

  #@@all stores all instances of race
  @@all = []

  def initialize(location = nil, url = nil) #date = nil, distances = nil, description = nil, hashtag = nil) #twitter = nil, facebook = nil, instagram = nil)
    @location = location
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.retrieve(input)
    self.all[input.to_i - 1] #takes user's input, subtracts 1, and uses that value as the index to retrieve from @@all
  end

  #def race_site #method that parses indiv race site
  #  RockNRoll::Scraper.new.scrape_races
  #  self.class.all.collect {|r| r.url}.each do |website| #creates new array of just urls
  #    @doc = Nokogiri::HTML(open(website))
  #    binding.pry
  #  end
  #end

  #def dates
  #  @race.date ||= race_site.css("#hero span.subhead").attribute("datetime").value
  #end

end
