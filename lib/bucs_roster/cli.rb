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
      puts "Enter the number of the player you would like to know more about: (1-#{Player.all.count}) or type 'exit' to end"
      user_input = gets.strip.to_i
    # binding.pry
      if user_input == 0
        goodbye
      end
      if user_input.between?(1, Player.all.count)
        user_input -=1
        Scraper.scrape_player(user_input) 
        Player.show_player_info(user_input)
        ask_again
      else 
        puts "Invalid entry.  Please try again."
        menu
      end
  end

  def ask_again
    puts "Would you like to explore another player? (Y/N)"
    input = gets.strip.downcase
    #binding.pry
    if input == "y" 
      menu
    else 
      goodbye
    end
  end

  def goodbye
    puts "Thanks for checking out the Tampa Bay Bucs!"
    exit
  end
  
end