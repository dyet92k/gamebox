# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gamebox/version"

Gem::Specification.new do |s|
  s.name        = "gamebox"
  s.version     = Gamebox::VERSION::STRING
  s.platform    = Gem::Platform::RUBY
  s.authors = ["Shawn Anderson", "Jason Roelofs", "Karlin Fox"]
  s.email = %q{shawn42@gmail.com}
  s.homepage = %q{http://shawn42.github.com/gamebox}
  s.description = %q{Framework for building and distributing games using Gosu}
  s.summary = %q{Framework for building and distributing games using Gosu}
  s.rubyforge_project = "gamebox"

  s.files         = `git ls-files`.split("\n").reject{ |f| f[/^examples\//] || f[/^\./] }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "gosu"
  s.add_dependency "constructor"
  s.add_dependency "publisher"
  s.add_dependency "diy"
  s.add_dependency "tween"
  s.add_dependency "require_all"
  s.add_dependency "kvo"

  s.add_development_dependency "pry", '~>0.9.7'
  s.add_development_dependency "pry-remote"
  s.add_development_dependency "rspec-core"
  s.add_development_dependency "rspec-mocks"
  s.add_development_dependency "rspec-expectations"
  s.add_development_dependency "mocha"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency "polaris"
  s.add_development_dependency "simplecov"
end

