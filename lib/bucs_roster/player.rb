class Player
  attr_accessor :player_name, :position, :jersey_number, :height, :weight, :age, :experience, :college, :player_URL, :bio
  @@all = []
  
  def initialize(player_name, player_URL)
    @player_name = player_name
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
  
end