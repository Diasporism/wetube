# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wetube/version'

Gem::Specification.new do |gem|
  gem.name          = "wetube"
  gem.version       = Wetube::VERSION
  gem.authors       = ["Paul Blackwell", "Logan Sears", "Geoff Schorkopf", "Kyle Suss"]
  gem.email         = ["gschorkopf@gmail.com"]
  gem.description   = %q{The WeTube gem was constructed to communicate with various API services in the gSchool service-oriented design project.}
  gem.summary       = %q{Simultaneous video watching! At your fingertips! Order today!}
  gem.homepage      = "http://www.github.com/diasporism/wetube"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
