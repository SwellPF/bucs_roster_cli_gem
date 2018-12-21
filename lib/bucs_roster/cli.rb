class CLI
  def start
    puts "Here are your Tampa Bay Buccaneers!"
    Scraper.new.scrape_index
    menu
  end
  
  def menu
    Player.all.each.with_index(1) do |player, index|
      puts "#{index}. #{player.player_name}"
    end
  end
  
end