class RockNRoll::Scraper

  ##def initialize(url = nil)
  ##  @url = url
  ##end

#scrape main page with list of all races
#this is the list that will appear immediately when program runs
#use this data to instantiate new objects of Race
  def scrape_races
    html = open("http://www.runrocknroll.com/")
    @doc = Nokogiri::HTML(html)
    @doc.search("div.mix").each do |race_div|
      @race = RockNRoll::Race.new #Scraper collaborates with Race class

      @race.location = race_div.css("h5 a").text
      @race.url = race_div.css("h5 a").attribute("href").text
      scrape_race_date
      scrape_race_description
      scrape_race_hashtag
      scrape_race_distances
      binding.pry
    end
      RockNRoll::Race.all #@all_races = @race.save #save method in Race
  end

  def scrape_race_date #method that parses indiv race site
    @race_site = Nokogiri::HTML(open(@race.url))
    @race_site.search("#hero").each do |header|
      @race.date = header.css("span strong").text.strip
    #@race.date = header.css("span.subhead").attribute("datetime").value gives the numeric date
    end
  end

  def scrape_race_description #method that parses indiv race site
    @race_site = Nokogiri::HTML(open(@race.url))
    @race_site.search("#features").each do |info_box|
    @race.description = info_box.css("div.column p").first.text
    end
  end

  def scrape_race_hashtag
    @race_site = Nokogiri::HTML(open(@race.url))
    @race_site.search("#ribbon").each do |social_media|
      @race.hashtag = social_media.css("div.hash").text.chomp(' /')
    end
  end

  def scrape_race_distances
    @race_distances = []
    @distance_url = @race.url + "the-races/distances/"
    @site = Nokogiri::HTML(open(@distance_url))
    @site.search("div.sidenav").each do |distances|
      distances.search("a").collect do |distance| #iterate through the XML of distances
        race_distance = distance.text #pull out each distance's text
        @race_distances << race_distance #adds the string of race_distance to the array
      end
      @race.distances = @race_distances.join(", ") #creates a comma-separated string of all the distances
    end
  end
end

#    scrape_races
#    RockNRoll::Race.all.collect {|r| r.url}.each do |website| #creates new array of just urls
#      @doc = Nokogiri::HTML(open(website))
      #binding.pry
#    end
#  end

  #def scrape_race_details
    #scrape_races
    #RockNRoll::Race.all.collect {|r| r.url}.each do |website| #creates new array of just urls
    #  @doc = Nokogiri::HTML(open(website)) #get HTML of each indiv race site
  #    @doc.search("#hero").each do |header| #loops through the urls, specifically the header section at top of page
  #      @race.date = header.css("span.subhead").attribute("datetime").value
        #binding.pry
  #    end


      #@doc.search("#races").each do |distance|
      #  binding.pry
      #  @race.distances = distance.css("h3").text
      #end
