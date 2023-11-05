# -*- encoding: utf-8 -*-
# stub: fog-vsphere 3.6.2 ruby lib

Gem::Specification.new do |s|
  s.name = "fog-vsphere".freeze
  s.version = "3.6.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["J.R. Garcia".freeze]
  s.date = "2023-06-29"
  s.description = "This library can be used as a module for `fog` or as standalone provider to use vSphere in applications.".freeze
  s.email = ["jr@garciaole.com".freeze]
  s.homepage = "https://github.com/fog/fog-vsphere".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7".freeze)
  s.rubygems_version = "3.3.5".freeze
  s.summary = "Module for the 'fog' gem to support VMware vSphere.".freeze

  s.installed_by_version = "3.3.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<fog-core>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<rbvmomi2>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<pry>.freeze, ["~> 0.10"])
    s.add_development_dependency(%q<rake>.freeze, [">= 12.3.3"])
    s.add_development_dependency(%q<minitest>.freeze, ["~> 5.8"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.39.0"])
    s.add_development_dependency(%q<rubocop-minitest>.freeze, [">= 0"])
    s.add_development_dependency(%q<rubocop-performance>.freeze, [">= 0"])
    s.add_development_dependency(%q<rubocop-rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<mocha>.freeze, ["~> 1.8"])
    s.add_development_dependency(%q<shindo>.freeze, ["~> 0.3"])
    s.add_development_dependency(%q<webmock>.freeze, ["~> 3.5"])
    s.add_development_dependency(%q<vcr>.freeze, ["~> 6.0"])
  else
    s.add_dependency(%q<fog-core>.freeze, [">= 0"])
    s.add_dependency(%q<rbvmomi2>.freeze, ["~> 3.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.10"])
    s.add_dependency(%q<rake>.freeze, [">= 12.3.3"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.8"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 1.39.0"])
    s.add_dependency(%q<rubocop-minitest>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop-performance>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop-rake>.freeze, [">= 0"])
    s.add_dependency(%q<mocha>.freeze, ["~> 1.8"])
    s.add_dependency(%q<shindo>.freeze, ["~> 0.3"])
    s.add_dependency(%q<webmock>.freeze, ["~> 3.5"])
    s.add_dependency(%q<vcr>.freeze, ["~> 6.0"])
  end
end
