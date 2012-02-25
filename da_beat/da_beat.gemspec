# -*- encoding: utf-8 -*-
require File.expand_path('../lib/da_beat/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["ZioBrando"]
  gem.email         = ["alberto.brandolini@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "da_beat"
  gem.require_paths = ["lib"]
  gem.version       = DaBeat::VERSION
end
