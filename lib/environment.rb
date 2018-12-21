require "nokogiri"
require "pry"


require_relative "./bucs_roster/version"
require_relative "./bucs_roster/cli"
require_relative "./bucs_roster/scraper"

module BucsRosterCliGem
  class Error < StandardError; end
  # Your code goes here...
end
