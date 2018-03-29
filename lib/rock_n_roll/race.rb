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

  def race_site #method that parses indiv race site
    RockNRoll::Scraper.new.scrape_races
    self.class.all.collect {|r| r.url}.each do |website| #creates new array of just urls
      @doc = Nokogiri::HTML(open(website))
      binding.pry
    end
  end

  def dates
    @race.date ||= race_site.css("#hero span.subhead").attribute("datetime").value
  end


  #def doc #method that parses indiv race site
  #  @doc ||= Nokogiri::HTML(open(self.url))
    #binding.pry
    #scrape_races
    #RockNRoll::Race.all.collect {|r| r.url}.each do |website| #creates new array of just urls
    #  @doc = Nokogiri::HTML(open(website))
    #end
  #end

  def race_details
    #scrape_races
    #RockNRoll::Race.all.collect {|r| r.url}.each do |website| #creates new array of just urls
    #  @doc = Nokogiri::HTML(open(website)) #get HTML of each indiv race site
      #doc.search("#hero").each do |header| #loops through the urls, specifically the header section at top of page
        @race.date = @doc.css("span.subhead").attribute("datetime").value
        binding.pry

      @doc.search("#features").each do |info_box|
        binding.pry
        @race.description = info_box.css("div.column.first p").text

      @doc.search("#ribbon").each do |social_media|
        @race.hashtag = social_media.css("div.hash").text
      #  @race.twitter = social_media.css("div.twitter a").attribute("href").text
      #  @race.facebook = social_media.css("div.facebook a").attribute("href").text
      #  @race.instagram = social_media.css("div.instagram a").attribute("href").text
      #  binding.pry
        #binding.pry
      end
    end
  end

end
