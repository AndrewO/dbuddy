# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dbuddy/version"

Gem::Specification.new do |s|
  s.name        = "dbuddy"
  s.version     = DBuddy::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Andrew O'Brien"]
  s.email       = ["andrew@econify.com"]
  s.homepage    = "http://github.com/AndrewO/db_exec"
  s.summary     = %q{Got stored procedures and views in your repo? Loading them should be simple.}
  s.description = %q{A small script to watch over bunches of raw SQL files and load them on changes. Or just load a bunch at once.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("watchr")
end
