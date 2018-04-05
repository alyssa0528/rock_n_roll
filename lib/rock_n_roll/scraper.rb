class RockNRoll::Scraper

  def scrape_races
    @doc = Nokogiri::HTML(open("http://www.runrocknroll.com/"))
    @doc.search("div.mix")
  end

  def create_races
    scrape_races.each do |race|
      RockNRoll::Race.new_from_list(race)
    end
  end

end
