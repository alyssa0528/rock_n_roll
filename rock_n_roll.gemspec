
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rock_n_roll/version"

Gem::Specification.new do |spec|
  spec.name          = "rock_n_roll"
  spec.version       = RockNRoll::VERSION
  spec.authors       = ["Alyssa Kim"]
  spec.email         = ["alyssa.kim@gmail.com"]

  spec.summary       = %q{This gem returns information about Rock 'n' Roll races around the world.}
  spec.description   = %q{This gem provides information on cities, dates, distances, hashtags, and URLs to Rock 'n' Roll races worldwide.}
  spec.homepage      = "https://github.com/alyssa0528/rock_n_roll"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a si#ngle host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata["allowed_push_host"] = "#TO: Set to 'http://mygemserver.com'"
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against " \
  #    "public gem pushes."
  #end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables << "rock_n_roll"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_dependency "nokogiri"
end