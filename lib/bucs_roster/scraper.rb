class Scraper

  def scrape_index
    html = open("https://www.buccaneers.com/team/players-roster/")
    doc = Nokogiri::HTML(html)
    doc.css(".nfl-o-roster__player-name").each do |player|
      name = player.css("a").text
      player_URL = "https://www.buccaneers.com" + player.css("a")[0]["href"]
      Player.new(name, player_URL)
    end
  end

  def self.scrape_player(index)
    player = Player.all[index]
  #  puts "SCRAPING FOR #{player.name} *******"
    html = open(player.player_URL)
    doc = Nokogiri::HTML(html)
    player.experience = doc.search("div.nfl-t-person-tile__details p")[0].text.gsub("Experience: ","")
    player.height = doc.search("div.nfl-t-person-tile__details p")[1].text.gsub("Height: ","")
    player.age = doc.search("div.nfl-t-person-tile__details p")[2].text.gsub("Age: ","")
    player.weight = doc.search("div.nfl-t-person-tile__details p")[3].text.gsub("Weight: ","")
    player.college = doc.search("div.nfl-t-person-tile__details p")[4].text.gsub("College: ","")
    player.position = doc.search("h3.d3-o-media-object__primary-subtitle").text.strip
    player.jersey_number = doc.search("h3.d3-o-media-object__secondary-subtitle").text.strip
    player.bio = ""
    bio = doc.search("div.nfl-c-body-part.nfl-c-body-part--text p")[2..-1]
    if bio != nil
      bio.each do |bio_fact|
      player.bio = player.bio + bio_fact.text + "\n\n"
      end
    else
      player.bio = "No player bio available."
    end

  end

end
