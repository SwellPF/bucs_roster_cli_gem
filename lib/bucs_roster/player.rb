class Player
  attr_accessor :name, :position, :jersey_number, :height, :weight, :age, :experience, :college, :player_URL, :bio
  @@all = []
  
  def initialize(name, player_URL)
    @name = name
    @player_URL = player_URL
    @position = position
    @jersey_number = jersey_number
    @height = height
    @weight = weight
    @age = age
    @experience = experience
    @college = college
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.show_player_info(index)
    player = self.all[index]
    puts " ---- Tampa Bay Buccaneers Player Profile ----"
    puts "            #{player.name.upcase} | #{player.jersey_number} | #{player.position}"
    puts ""
    puts "Height: #{player.height}"
    puts "Weight: #{player.weight}"
    puts "Age: #{player.age}"
    puts "College: #{player.college}"
    puts "Experience: #{player.experience}"
    puts "Biography: \n#{player.bio}"
  end
end