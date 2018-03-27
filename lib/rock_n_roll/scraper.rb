class RockNRoll::Scraper

  def initialize(url = nil)
    @url = url
  end

  #def scrape
  #  @races = []
  #  @races << self.scrape_main
  #end

#scrape main page with list of all races
#use this data to instantiate new objects of Race
  def scrape_races
    html = open("http://www.runrocknroll.com/")
    @doc = Nokogiri::HTML(html)
    @doc.search("div.mix").each do |race_div|
      race = RockNRoll::Race.new #Scraper collaborates with Race class

      race.location = race_div.css("h5 a").text
      race.url = race_div.css("h5 a").attribute("href").text
      race.save #save method in Race
      #binding.pry
    end
  end

  def scrape_race_details
    html = open(@url)
    @doc = Nokogiri::HTML(html)
    @doc.search()
  #binding.pry
  end
end
