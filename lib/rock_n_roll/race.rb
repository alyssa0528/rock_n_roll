class RockNRoll::Race
  attr_accessor :location, :url, :date, :distances, :description, :hashtag

  @@all = []

  def initialize(location = nil, url = nil)
    @location = location
    @url = url
    @@all << self
  end

  def self.new_from_list(race)
    location = race.css("h3 a").text
    if location == ""
      location = "TBD"
    end
    url = "https://www.runrocknroll.com" + race.css("h3 a").attribute("href").text
    if !url.end_with?("/")
      url += "/"
    elsif url == ""
      url = "TBD"
    end
    self.new(location, url)
  end

  def self.all
    @@all
  end

  def self.retrieve(input)
    self.all[input.to_i - 1]
  end

  def race_site
    @race_site ||= Nokogiri::HTML(open(self.url))
  end

  def date
    @date = race_site.search("h3 time").text.strip
  end

  def description
    @description = race_site.search(".caption p").first.text.strip
    if @description == "Leer Más" || @description == ""
      @description = "Please click on the race's URL for more information."
    else
      @description
    end
  end

  def hashtag
    @hashtag = race_site.search(".twitter-handle").text.chomp(' /').strip
  end

  def distances
    @race_distances = []
    distance_url = self.url + "the-races/courses/"
    @distance_site = Nokogiri::HTML(open(distance_url))
    @distance_site.search("div ul.nav-justified li").each do |distances|
      distances.search("a").collect do |distance| #iterate through the XML of distances
        race_distance = distance.text.strip
        @race_distances << race_distance
      end
    end
    @distances = @race_distances.join(", ")
  end
end
