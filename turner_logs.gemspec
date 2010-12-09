# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "turner_logs/version"

Gem::Specification.new do |s|
  s.name        = "turner_logs"
  s.version     = TurnerLogs::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ben Sharpe"]
  s.email       = ["me@bsharpe.com"]
  s.homepage    = "http://bsharpe.com"
  s.summary     = %q{Colorize your B&W Rails logs}
  s.description = %q{Support for color escape codes in the Rails logger}

  s.rubyforge_project = "turner_logs"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
