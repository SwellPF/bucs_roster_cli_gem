require "nokogiri"
require "open-uri"
require "pry"


require_relative "./bucs_roster/version"
require_relative "./bucs_roster/cli"
require_relative "./bucs_roster/scraper"
require_relative "./bucs_roster/player"

module BucsRosterCliGem
  class Error < StandardError; end
  # Your code goes here...
end
