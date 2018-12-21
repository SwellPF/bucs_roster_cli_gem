class Scraper
  
  def scrape_index
    html = open("https://www.buccaneers.com/team/players-roster/")
    doc = Nokogiri::HTML(html)
    doc.css(".nfl-o-roster__player-name a").each do |player|
      player_name = player.css(".nfl-o-roster__player-name a").text
      Player.new(player_name)
    binding.pry
    end
    binding.pry
  end
  
end