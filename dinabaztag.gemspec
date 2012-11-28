# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dinabaztag/version"

Gem::Specification.new do |s|
  s.name        = 'dinabaztag'
  s.version     = Dinabaztag::VERSION
  s.date        = '2012-11-28'
  s.summary     = "Dinabaztag is a Ruby Wrapper for Nabaztag API!"
  s.description = "Dinabaztag is a Ruby Wrapper for Nabaztag API!"
  s.authors     = ["Miklós Beöthy"]
  s.email       = 'beothy.miklos@digitalnatives.hu'
  s.homepage    = 'https://github.com/digitalnatives/dinabaztag'
  s.files         = `git ls-files`.split("\n").sort
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
