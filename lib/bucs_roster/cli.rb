class CLI
  def start
    puts "Here are your Tampa Bay Buccaneers!"
    Scraper.new.scrape_index
    menu
  end
  
  def menu
    Player.all.each.with_index(1) do |player, index|
      puts "#{index}. #{player.name}"
    end
      puts "Enter the number of the player you would like to know more about: (1-#{Player.all.count})"
      user_input = gets.strip.to_i
     # binding.pry
      if user_input.between?(1, Player.all.count)
        user_input -=1
        Scraper.scrape_player(user_input) 
        Player.show_player_info(user_input)
      else menu
      end
  end
  
end