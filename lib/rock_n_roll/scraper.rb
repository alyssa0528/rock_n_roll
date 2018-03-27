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
      race = RockNRoll::Race.new
      binding.pry
      race.location = race_div.css("h5 a").text
      race.url = race_div.css("h5 a").attribute("href").text
    end
    race.save
  #binding.pry
  end

  def scrape_race_details
    html = open("http://www.runrocknroll.com/san-francisco/")
    doc = Nokogiri::HTML(html)
  #binding.pry
  end
end
