
$:.push File.expand_path("../lib", __FILE__)
require "to_ascii/version"

Gem::Specification.new do |s|
  s.name        = "to_ascii"
  s.version     = ToAscii::VERSION
  s.authors     = ["Benjamin Vetter"]
  s.email       = ["vetter@flakks.com"]
  s.homepage    = ""
  s.summary     = %q{Convert locale dependent characters}
  s.description = %q{Convert locale dependent characters to the appropriate ascii versions}

  s.rubyforge_project = "to_ascii"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
end
