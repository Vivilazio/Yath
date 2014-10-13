# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "yath/version"

Gem::Specification.new do |s|
  s.name        = "yath"
  s.version     = Yath::VERSION
  s.authors     = ["Alessio Caradossi"]
  s.email       = ["alessio@theeyes.org"]
  s.homepage    = ""
  s.summary     = %q{Useful to create tabbed links}
  s.description = %q{Yet another tabs helper helps you to create your tabbed links using a simple ruby dsl }

  s.rubyforge_project = "yath"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
   s.add_development_dependency "rails", "~> 4.0"
   s.add_runtime_dependency "rails", "~> 4.0"
end
