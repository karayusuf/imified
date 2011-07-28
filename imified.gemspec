# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "imified/version"

Gem::Specification.new do |s|
  s.name        = "imified"
  s.version     = Imified::VERSION
  s.authors     = ["Joe Karayusuf"]
  s.email       = ["jkarayusuf@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{ Simple Instant Messaging API using the IMified platform. }
  s.description = %q{ TODO: Write a description of the gem. }

  s.rubyforge_project = "imified"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rspec'

end
