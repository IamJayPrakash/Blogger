# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fog/cloudstack/version'

Gem::Specification.new do |spec|
  spec.name        = 'fog-cloudstack'
  spec.version     = Fog::Cloudstack::VERSION
  spec.authors     = ['cloud.ca', 'geemus (Wesley Beary)']
  spec.email       = ['infra@cloud.ca', 'geemus@gmail.com']

  spec.summary     = %q{Module for the 'fog' gem to support Cloudstack}
  spec.description = %q{Module for the 'fog' gem to support Cloudstack}
  spec.homepage    = 'https://github.com/fog/fog-cloudstack'
  spec.license     = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>=2.0.0'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'rubyzip', '~> 1.2.1'
  spec.add_development_dependency 'shindo',  '~> 0.3'

  spec.add_dependency 'fog-core',  '~> 2.1'
  spec.add_dependency 'fog-json',  '~> 1.1'
  spec.add_dependency 'fog-xml',   '~> 0.1'
end
