class CLI
  def start
    puts "Here are your Tampa Bay Buccaneers!"
    Scraper.new.scrape_index
    menu
  end
  
  def menu
    @pointer ||= 0
    #binding.pry
    Player.all[@pointer,30].each.with_index(@pointer+1) do |player, index|
      puts "#{index}. #{player.name}"
    end
      puts "Enter the number of the player you would like to know more about, '+' for next group, '-' for previous group or type 'exit' to end."
      user_input = gets.strip
    #binding.pry
    case 
    when user_input == "exit"
        goodbye
    when user_input == "+"
        @pointer += 30
      #  binding.pry
        @pointer = (Player.all.count)-30 if @pointer > Player.all.count
        menu
    when user_input == "-"
        @pointer -= 30
     #   binding.pry
        @pointer = 0 if @pointer < 0
        menu
    end    
    user_input = user_input.to_i
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
   # binding.pry
    if input[0] == "y" 
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
