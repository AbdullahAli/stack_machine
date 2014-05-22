# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stack_machine/version'

Gem::Specification.new do |spec|
  spec.name          = "stack_machine"
  spec.version       = StackMachine::VERSION
  spec.authors       = ["Abdullah Ali"]
  spec.email         = ["abdullah-ali@hotmail.co.uk"]
  spec.summary       = %q{A stack machine for job interview}
  spec.description   = %q{A stack machine for job interview for HouseTrip}
  spec.homepage      = "https://github.com/AbdullahAli"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 0"
  spec.add_development_dependency "rspec", "~> 2.14"
end
