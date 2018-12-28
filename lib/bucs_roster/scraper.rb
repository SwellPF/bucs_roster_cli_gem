class Scraper
  
  def scrape_index
    html = open("https://www.buccaneers.com/team/players-roster/")
    doc = Nokogiri::HTML(html)
    doc.css(".nfl-o-roster__player-name").each do |player|
      player_name = player.css("a").text
      player_URL = "https://www.buccaneers.com" + player.css("a")[0]["href"]
      binding.pry
      Player.new(player_name, player_URL)
   # binding.pry
    end
    binding.pry
    Player.all
  end
  
end