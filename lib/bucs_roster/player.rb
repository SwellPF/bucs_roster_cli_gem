class BucsRoster::Player
  attr_accessor :name, :position, :jersey_number, :height, :weight, :age, :experience, :college, :player_URL, :bio
  @@all = []

  def initialize(name, player_URL)
    @name = name
    @player_URL = player_URL
    @@all << self
  end

  def self.all
    @@all
  end


end
