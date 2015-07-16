# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'recoil/version'

Gem::Specification.new do |s|
  s.name          = "recoil"
  s.version       = Recoil::VERSION
  s.authors       = ["Brightin"]
  s.email         = ["developers@brightin.nl"]
  s.summary       = 'Send emails with Amazon SES with automatic blacklisting'
  s.description   = 'Send emails with Amazon SES with automatic blacklisting'
  s.homepage      = "http://www.brightin.nl"
  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0")
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency 'rails', '>= 4.0'
  s.add_dependency 'aws-sdk', '< 2'

  s.add_development_dependency "rspec", "~> 3.2.0"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "vcr", "~> 2.9.0"
  s.add_development_dependency "webmock", "~> 1.20.0"
end
