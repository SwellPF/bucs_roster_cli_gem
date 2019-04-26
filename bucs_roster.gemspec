require_relative "./lib/bucs_roster/version"

Gem::Specification.new do |spec|
  spec.name          = "bucs_roster"
  spec.version       = BucsRoster::VERSION
  spec.authors       = ["'Paul Fell-Cinoman'"]
  spec.email         = ["'swellpf@gmail.com'"]
  spec.date          = '2019-04-26'

  spec.summary       = "Tampa Bay Buccaneers Player Roster"
  spec.description   = "Provides details about players on the active team roster"
  spec.homepage      = "http://rubygems.org/gems/bucs-roster"
  spec.license       = "MIT"
  spec.files         = ["lib/bucs_roster.rb", "lib/bucs_roster/cli.rb", "lib/bucs_roster/player.rb", "lib/bucs_roster/scraper.rb", "config/environment.rb"]
  spec.executables << 'bucs_roster'

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri", ">=0"
  spec.add_development_dependency "pry", ">=0"
end
