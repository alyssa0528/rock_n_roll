
[1mFrom:[0m /home/alyssa0528/cli-data-gem-assessment-v-000/rock_n_roll/lib/rock_n_roll/scraper.rb @ line 40 RockNRoll::Scraper#scrape_race_details:

    [1;34m21[0m: [32mdef[0m [1;34mscrape_race_details[0m
    [1;34m22[0m:   scrape_races
    [1;34m23[0m:   @all_races.collect {|r| r.url}.each [32mdo[0m |website| [1;34m#creates new array of just urls[0m
    [1;34m24[0m:     @doc = [1;34;4mNokogiri[0m::HTML(open(website)) [1;34m#get HTML of each indiv race site[0m
    [1;34m25[0m: 
    [1;34m26[0m:     [1;34m#@doc.search("#hero").each do |header| #loops through the urls, specifically the header section at top of page[0m
    [1;34m27[0m:     [1;34m#  binding.pry[0m
    [1;34m28[0m:     [1;34m#  @race.date = header.css("span.subhead").attribute("datetime").value[0m
    [1;34m29[0m:     [1;34m#end[0m
    [1;34m30[0m: 
    [1;34m31[0m:     [1;34m#@doc.search("#ribbon").each do |social_media|[0m
    [1;34m32[0m:     [1;34m#binding.pry[0m
    [1;34m33[0m:     [1;34m#  @race.hashtag = social_media.css("div.hash").text[0m
    [1;34m34[0m:     [1;34m#  @race.twitter = social_media.css("div.twitter a").attribute("href").text[0m
    [1;34m35[0m:     [1;34m#  @race.facebook = social_media.css("div.facebook a").attribute("href").text[0m
    [1;34m36[0m:     [1;34m#  @race.instagram = social_media.css("div.instagram a").attribute("href").text[0m
    [1;34m37[0m:     [1;34m#  end[0m
    [1;34m38[0m: 
    [1;34m39[0m:     @doc.search([31m[1;31m"[0m[31m#races[1;31m"[0m[31m[0m).each [32mdo[0m |distance|
 => [1;34m40[0m:       binding.pry
    [1;34m41[0m:     [1;34m#  @race.distances = distance.css("h3").text[0m
    [1;34m42[0m:     [32mend[0m
    [1;34m43[0m:   [32mend[0m
    [1;34m44[0m: [32mend[0m

