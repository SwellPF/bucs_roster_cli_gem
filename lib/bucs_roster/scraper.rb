class Scraper
  
  def scrape_index
    html = open("https://www.buccaneers.com/team/players-roster/")
    doc = Nokogiri::HTML(html)
    doc.css(".nfl-o-roster__player-name").each do |player|
      player_name = player.css("a").text
      player_URL = "https://www.buccaneers.com" + player.css("a")[0]["href"]
   #   binding.pry
      Player.new(player_name, player_URL)
   # binding.pry
    end
   # binding.pry
  end
  
  def self.scrape_player(index)
   # binding.pry 
    html = open(Player.all[index].player_URL)
    doc = Nokogiri::HTML(html)
   # binding.pry
    experience = doc.search("div.nfl-t-person-tile__details p")[0].text.gsub("Experience: ","")
    height = doc.search("div.nfl-t-person-tile__details p")[1].text.gsub("Height: ","")
    age = doc.search("div.nfl-t-person-tile__details p")[2].text.gsub("Age: ","")
    weight = doc.search("div.nfl-t-person-tile__details p")[3].text.gsub("Weight: ","")
    college = doc.search("div.nfl-t-person-tile__details p")[4].text.gsub("College: ","")
    bio = ""
    doc.css("div.nfl-o-biography__text p")[2..-1].each do |bio_fact|
      bio = bio + bio_fact + "\n"
    end
    puts bio
    binding.pry
  end
  
end