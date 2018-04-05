class RockNRoll::Race
  attr_accessor :location, :url, :date, :distances, :description, :hashtag

  @@all = []

  def initialize(location = nil, url = nil)
    @location = location
    @url = url
    @@all << self
    #binding.pry
  end

  def self.new_from_list(race)
    url = race.css("h5 a").attribute("href").text
    if !url.end_with?("/")
      url += "/"
    end
    self.new(race.css("h5 a").text, url)
  end

  def self.all
    @@all
  end

  def self.retrieve(input)
    self.all[input.to_i - 1] #takes user's input, subtracts 1, and uses that value as the index to retrieve from @@all
  end

  def race_site
    #binding.pry
    @race_site ||= Nokogiri::HTML(open(self.url))
  end

  def date #method that parses indiv race site
    #@race_site = Nokogiri::HTML(open(@race.url))
    #@race_site.search("#hero").each do |header|
    @date = race_site.search("#hero span strong").text.strip #correct
    #binding.pry
    #end
  end

  def description #method that parses indiv race site for description
    #@race_site = Nokogiri::HTML(open(@race.url))
    #@race_site.search("#features").each do |info_box|
    @description = race_site.search("#features div.column p").first.text #correct
    #binding.pry
    if @description == "Leer Más"
      @description = "Please click on the race's URL for more information."
    else
      @description
    end
    #end
  end

  def hashtag #parses hashtag info
    #@race_site = Nokogiri::HTML(open(@race.url))
    #@race_site.search("#ribbon").each do |social_media|
      @hashtag = race_site.search("#ribbon div.hash").text.chomp(' /') #correct
    #end
  end

  #def url
  #  @distance_page = self.url + "the-races/distances/"
  #  @distance_url = Nokogiri::HTML(open(@distance_page))
  #end

  def distances
    #parses race distances info
    @race_distances = []
    distance_url = self.url + "the-races/distances/"
    binding.pry
    @distance_site = Nokogiri::HTML(open(distance_url))
    @distance_site.search("div.sidenav").each do |distances|
      distances.search("a").collect do |distance| #iterate through the XML of distances
        race_distance = distance.text #pull out each distance's text
        @race_distances << race_distance
        binding.pry
      end
    @distances = @race_distances.join(", ") #creates a comma-separated string of all the distances
      #binding.pry
    end
  end
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
