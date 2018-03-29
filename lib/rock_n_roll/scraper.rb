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
      #binding.pry
    end
    #@race_site = Nokogiri::HTML(open(@race.url))
    #binding.pry
      RockNRoll::Race.all #@all_races = @race.save #save method in Race
  end

  #data is getting incorrectly added to the last @race instance (Luoping) because it was the most recently accessed one...
  def scrape_race_date #method that parses indiv race site
    @race_site = Nokogiri::HTML(open(@race.url))
    @race_site.search("#hero").each do |header|
    @race.date = header.css("span.subhead").attribute("datetime").value
    end
  end

  def scrape_race_description #method that parses indiv race site
    #binding.pry
    @race_site = Nokogiri::HTML(open(@race.url))
    @race_site.search("#features").each do |info_box|
      #binding.pry
    @race.description = info_box.css("div.column p").first.text
    #binding.pry
    end
  end

  def scrape_race_hashtag
    @race_site = Nokogiri::HTML(open(@race.url))
    @race_site.search("#ribbon").each do |social_media|
      @race.hashtag = social_media.css("div.hash").text
    end
  end

#    scrape_races
#    RockNRoll::Race.all.collect {|r| r.url}.each do |website| #creates new array of just urls
#      @doc = Nokogiri::HTML(open(website))
      #binding.pry
#    end
#  end

  def dates
    @race.date
  end

  def scrape_race_distances
    @distance_url = @race.url + "the-races/distances"
    @site = Nokogiri::HTML(open(@distance_url))
    @site.search("div.sidenav").each do |distance|
      @race.distances = distance.css("a").text
    end
  end

end

  #def scrape_race_details
    #scrape_races
    #RockNRoll::Race.all.collect {|r| r.url}.each do |website| #creates new array of just urls
    #  @doc = Nokogiri::HTML(open(website)) #get HTML of each indiv race site
  #    @doc.search("#hero").each do |header| #loops through the urls, specifically the header section at top of page
  #      @race.date = header.css("span.subhead").attribute("datetime").value
        #binding.pry
  #    end

  #    @doc.search("#features").each do |info_box|
  #      binding.pry
  #      @race.description = info_box.css("div.column.first p").text

  #
      #  @race.twitter = social_media.css("div.twitter a").attribute("href").text
      #  @race.facebook = social_media.css("div.facebook a").attribute("href").text
      #  @race.instagram = social_media.css("div.instagram a").attribute("href").text
      #  binding.pry
        #binding.pry
  #    end
  #  end
  #end

      #@doc.search("#races").each do |distance|
      #  binding.pry
      #  @race.distances = distance.css("h3").text
      #end
