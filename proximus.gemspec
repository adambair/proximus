# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "proximus/version"

Gem::Specification.new do |s|
  s.name        = "proximus"
  s.version     = Proximus::VERSION
  s.authors     = ["Adam Bair"]
  s.email       = ["adambair@gmail.com"]
  s.homepage    = "http://github.com/adambair/proximus"
  s.summary     = %q{Coming Soon - API shenanigans}
  s.description = %q{Someday I'll grow up and proxy API calls}

  s.rubyforge_project = "proximus"

  s.add_dependency = "restclient"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
