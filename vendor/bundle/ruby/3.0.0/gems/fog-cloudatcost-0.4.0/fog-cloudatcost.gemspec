# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fog/cloudatcost/version'

Gem::Specification.new do |spec|
  spec.name = 'fog-cloudatcost'
  spec.version = Fog::CloudAtCost::VERSION
  spec.authors = ['Suraj Shirvankar']
  spec.email = ['surajshirvankar@gmail.com']
  spec.summary = "Module for the 'fog' gem to support CloudAtCost."
  spec.description =
    'This library can be used as a module for `fog` or as standalone provider to use the CloudAtCost in applications.'
  spec.homepage = 'http://github.com/fog/fog-cloudatcost'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubyzip'
  spec.add_development_dependency 'simplecov'

  spec.add_dependency 'fog-core'
  spec.add_dependency 'fog-json'
  spec.add_dependency 'ipaddress'
end
