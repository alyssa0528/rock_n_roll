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
      #RockNRoll::Race.all
      #binding.pry
    end
  end

  def scrape_race_details
    scrape_races
    @all_races.collect {|r| r.url}.each do |website| #creates new array of just urls
      @doc = Nokogiri::HTML(open(website))

      @doc.search("#hero").each do |header| #loops through the urls, specifically the header section at top of page
      @race.date = header.css(".bigtext-line1 span")#.attribute("datetime").text #creates new array of just urls
         binding.pry
       end
     end
       #html = open(race.url)
       #@doc = Nokogiri::HTML(html)
      #  @doc.search("#hero").each do |header|
    #      @race.date = header.css("h1.bigtext-line1 span").attribute("datetime").text
      #  end
    end
end
