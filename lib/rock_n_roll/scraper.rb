class RockNRoll::Scraper

#this is the list that will appear immediately when program runs
#use this data to instantiate new objects of Race
  def scrape_races
    @doc = Nokogiri::HTML(open("http://www.runrocknroll.com/"))
    @doc.search("div.mix")
  end

  ##  .each do |race_div|
  ##    @race = RockNRoll::Race.new

  ##    @race.location = race_div.css("h5 a").text
  ##    @race.url = race_div.css("h5 a").attribute("href").text
  ##      if !@race.url.end_with? ("/")
  ##        @race.url += "/"
  ##      end
  ##    scrape_race_date
  ##    scrape_race_description
  ##    scrape_race_hashtag
  ##    scrape_race_distances
  ##  end
  #    RockNRoll::Race.all
  #end

#create race objects based on scraped data
  def create_races
    scrape_races.each do |race|
      RockNRoll::Race.new_from_list(race)
      #binding.pry
    end
  end

end
