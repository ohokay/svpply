# -*- encoding: utf-8 -*-
require File.expand_path('../lib/svpply/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jeff Mehlhoff"]
  gem.email         = ["jeffmehlhoff@mac.com"]
  gem.description   = %q{Ruby wrapper for the Svpply api}
  gem.summary       = %q{}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "svpply"
  gem.require_paths = ["lib"]
  gem.version       = Svpply::VERSION

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "webmock"
  gem.add_development_dependency "vcr"
  gem.add_runtime_dependency "httparty"
end
