class RockNRoll::Scraper

  def initialize(url = nil)
    @url = url
  end

  def scrape_race_details
    RockNRoll::Race.all.each do |race|
       race.url #creates new array
         binding.pry
       #html = open(race.url)
       #@doc = Nokogiri::HTML(html)
      #  @doc.search("#hero").each do |header|
    #      @race.date = header.css("h1.bigtext-line1 span").attribute("datetime").text
      #  end
      end
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
      @race.save
      RockNRoll::Race.all #save method in Race
      #binding.pry
    end
  end
end
