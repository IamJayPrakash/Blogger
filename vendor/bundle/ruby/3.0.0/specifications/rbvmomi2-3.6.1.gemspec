# -*- encoding: utf-8 -*-
# stub: rbvmomi2 3.6.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rbvmomi2".freeze
  s.version = "3.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Adam Grare".freeze, "Jason Frey".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-05-15"
  s.email = ["adam@grare.com".freeze, "fryguy9@gmail.com".freeze]
  s.executables = ["rbvmomish".freeze]
  s.files = ["exe/rbvmomish".freeze]
  s.homepage = "https://github.com/ManageIQ/rbvmomi2".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.1".freeze)
  s.rubygems_version = "3.3.5".freeze
  s.summary = "Ruby interface to the VMware vSphere API".freeze

  s.installed_by_version = "3.3.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<builder>.freeze, ["~> 3.2"])
    s.add_runtime_dependency(%q<json>.freeze, ["~> 2.3"])
    s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 1.12.5", "~> 1.12"])
    s.add_runtime_dependency(%q<optimist>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_development_dependency(%q<pry>.freeze, ["~> 0.14.1"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.19.0"])
    s.add_development_dependency(%q<soap4r-ng>.freeze, ["~> 2.0"])
    s.add_development_dependency(%q<test-unit>.freeze, ["~> 3.3"])
    s.add_development_dependency(%q<yard>.freeze, ["~> 0.9.25"])
  else
    s.add_dependency(%q<builder>.freeze, ["~> 3.2"])
    s.add_dependency(%q<json>.freeze, ["~> 2.3"])
    s.add_dependency(%q<nokogiri>.freeze, [">= 1.12.5", "~> 1.12"])
    s.add_dependency(%q<optimist>.freeze, ["~> 3.0"])
    s.add_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.14.1"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 1.0"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.19.0"])
    s.add_dependency(%q<soap4r-ng>.freeze, ["~> 2.0"])
    s.add_dependency(%q<test-unit>.freeze, ["~> 3.3"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.9.25"])
  end
end
