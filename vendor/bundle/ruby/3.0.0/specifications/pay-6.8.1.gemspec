# -*- encoding: utf-8 -*-
# stub: pay 6.8.1 ruby lib

Gem::Specification.new do |s|
  s.name = "pay".freeze
  s.version = "6.8.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jason Charnes".freeze, "Chris Oliver".freeze, "Collin Jilbert".freeze]
  s.date = "2023-09-05"
  s.description = "Stripe, Paddle, and Braintree payments for Ruby on Rails apps".freeze
  s.email = ["jason@thecharnes.com".freeze, "excid3@gmail.com".freeze, "cjilbert504@gmail.com".freeze]
  s.homepage = "https://github.com/pay-rails/pay".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.5".freeze
  s.summary = "Payments engine for Ruby on Rails".freeze

  s.installed_by_version = "3.3.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 6.0.0"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 6.0.0"])
  end
end
