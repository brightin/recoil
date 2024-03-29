# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'recoil/version'

Gem::Specification.new do |s|
  s.name          = 'recoil'
  s.version       = Recoil::VERSION
  s.authors       = ['Brightin']
  s.email         = ['developers@brightin.nl']
  s.summary       = 'Send emails with Amazon SES with automatic blacklisting'
  s.description   = 'Send emails with Amazon SES with automatic blacklisting'
  s.homepage      = 'http://www.brightin.nl'
  s.license       = 'MIT'

  s.files         = `git ls-files -z`.split("\x0")
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_dependency 'rails', '>= 5.2'
  s.add_dependency 'aws-sdk', '< 2'

  s.add_development_dependency 'brakeman'
  s.add_development_dependency 'codeclimate-test-reporter'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-rspec'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'vcr', '~> 2.9.0'
  s.add_development_dependency 'webmock', '~> 2.3.2'
end
