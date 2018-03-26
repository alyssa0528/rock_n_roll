#method that adds all new scrape instances to @races instance variable
class RockNRoll::Scraper

  def scrape
    @races = []
    @races << self.scrape_main
  end

#scrape main page
  def scrape_main
    html = open("http://www.runrocknroll.com/")
    doc = Nokogiri::HTML(html)

    race = self.new
    race.location = doc.css("h5 a").text
    race.url = doc.css("h5 a").attribute("href").text
  #binding.pry
  end

  def scrape_race_details
    html = open("http://www.runrocknroll.com/san-francisco/")
    doc = Nokogiri::HTML(html)
  binding.pry
  end
end
