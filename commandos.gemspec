# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'commandos/version'

Gem::Specification.new do |spec|
  spec.name          = "commandos"
  spec.version       = Commandos::VERSION
  spec.authors       = ["Michael Elkins"]
  spec.email         = ["mike@mdelkins.com"]

  spec.summary       = %q{Commandos is a library to support the command design pattern}
  spec.description   = %q{Commandos is a library to help build the series of objects needed for the command design pattern.  It can help wtih building commands, handlers to execute commands, and command registries.}
  spec.homepage      = "https://github.com/mdelkins/commando"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bump",    "~> 0.5"
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-color", "~> 0.0"
end
