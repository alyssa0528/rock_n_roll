class RockNRoll::Scraper

  def initialize(url = nil)
    @url = url
  end


    #@doc = Nokogiri::HTML(open(@url))
    #@doc.search("#hero").each do |header|
      #binding.pry
      #@race.date = header.css("h1.bigtext-line1 span").attribute("datetime").text
    #end

#scrape main page with list of all races
#use this data to instantiate new objects of Race
  def scrape_races
    html = open("http://www.runrocknroll.com/")
    @doc = Nokogiri::HTML(html)
    @doc.search("div.mix").each do |race_div|
      @race = RockNRoll::Race.new #Scraper collaborates with Race class

      @race.location = race_div.css("h5 a").text
      @race.url = race_div.css("h5 a").attribute("href").text
      @all_races = @race.save #save method in Race
    end
  end

  def scrape_race_details
    scrape_races
    @all_races.collect {|r| r.url}.each do |website| #creates new array of just urls
      @doc = Nokogiri::HTML(open(website)) #get HTML of each indiv race site

      @doc.search("wrapper mid").each do |social_media|
        binding.pry
        @race.hashtag = social_media.css("div.hash").text
        @race.twitter = social_media.css("div.twitter a").attribute("href").text
        @race.facebook = social_media.css("div.facebook a").attribute("href").text
        @race.instagram = social_media.css("div.instagram a").attribute("href").text
      end
      @doc.search("#hero").each do |header| #loops through the urls, specifically the header section at top of page
        @race.date = header.css("span.subhead").attribute("datetime").value
      end
    end
  end
       #html = open(race.url)
       #@doc = Nokogiri::HTML(html)
      #  @doc.search("#hero").each do |header|
    #      @race.date = header.css("h1.bigtext-line1 span").attribute("datetime").text
      #  end
end
