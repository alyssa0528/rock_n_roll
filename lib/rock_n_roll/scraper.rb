class RockNRoll::Scraper

#this is the list that will appear immediately when program runs
#use this data to instantiate new objects of Race
  def scrape_races
    html = open("http://www.runrocknroll.com/")
    @doc = Nokogiri::HTML(html)
    @doc.search("div.mix").each do |race_div|
      @race = RockNRoll::Race.new

      @race.location = race_div.css("h5 a").text
      @race.url = race_div.css("h5 a").attribute("href").text
        if !@race.url.end_with? ("/")
          @race.url += "/"
        end
      scrape_race_date
      scrape_race_description
      scrape_race_hashtag
      scrape_race_distances
    end
      RockNRoll::Race.all
  end

  def scrape_race_date #method that parses indiv race site
    @race_site = Nokogiri::HTML(open(@race.url))
    @race_site.search("#hero").each do |header|
      @race.date = header.css("span strong").text.strip
    end
  end

  def scrape_race_description #method that parses indiv race site for description
    @race_site = Nokogiri::HTML(open(@race.url))
    @race_site.search("#features").each do |info_box|
    @race.description = info_box.css("div.column p").first.text
    if @race.description == "Leer Más"
      @race.description = "Please click on the race's URL for more information."
    end
    end
  end

  def scrape_race_hashtag #parses hashtag info
    @race_site = Nokogiri::HTML(open(@race.url))
    @race_site.search("#ribbon").each do |social_media|
      @race.hashtag = social_media.css("div.hash").text.chomp(' /')
    end
  end

  def scrape_race_distances #parses race distances info
    @race_distances = []
    @distance_url = @race.url + "the-races/distances/"
  #  puts @race_url
    @race_site = Nokogiri::HTML(open(@distance_url))
    @race_site.search("div.sidenav").each do |distances|
      distances.search("a").collect do |distance| #iterate through the XML of distances
        race_distance = distance.text #pull out each distance's text
        @race_distances << race_distance #adds the string of race_distance to the array
      end
      @race.distances = @race_distances.join(", ") #creates a comma-separated string of all the distances
    end
  end
end
