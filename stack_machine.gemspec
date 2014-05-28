# coding: utf-8
require File.expand_path('../lib/stack_machine/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'stack_machine'
  gem.authors       = 'Abdullah Ali'
  gem.version       = StackMachine::VERSION
  gem.email         = 'abdullah-ali@hotmail.co.uk'
  gem.description   = %q{A Stack Machine processor.  Able to apply addition and multiplication on integer characters}
  gem.summary       = %q{A Stack Machine processor}
  gem.homepage      = "https://github.com/AbdullahAli/stack_machine"
  gem.license       = 'MIT'
  gem.files         = `git ls-files`.split($\)
  gem.require_paths = ['lib']

  gem.add_development_dependency "bundler", "~> 1.5"
  gem.add_development_dependency "rake", "~> 10.0"
  gem.add_development_dependency "rspec", "~> 2.14"
end
