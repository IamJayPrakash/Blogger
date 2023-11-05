# -*- encoding: utf-8 -*-
# stub: fog-google 1.22.0 ruby lib

Gem::Specification.new do |s|
  s.name = "fog-google".freeze
  s.version = "1.22.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nat Welch".freeze, "Artem Yakimenko".freeze]
  s.date = "2023-08-10"
  s.description = "This library can be used as a module for `fog` or as standalone provider to use the Google Cloud in applications.".freeze
  s.email = ["nat@natwelch.com".freeze, "temikus@google.com".freeze]
  s.homepage = "https://github.com/fog/fog-google".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0".freeze)
  s.rubygems_version = "3.3.5".freeze
  s.summary = "Module for the 'fog' gem to support Google.".freeze

  s.installed_by_version = "3.3.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<fog-core>.freeze, ["< 2.3"])
    s.add_runtime_dependency(%q<fog-json>.freeze, ["~> 1.2"])
    s.add_runtime_dependency(%q<fog-xml>.freeze, ["~> 0.1.0"])
    s.add_runtime_dependency(%q<google-apis-storage_v1>.freeze, [">= 0.19", "< 1"])
    s.add_runtime_dependency(%q<google-apis-iamcredentials_v1>.freeze, ["~> 0.15"])
    s.add_runtime_dependency(%q<google-apis-compute_v1>.freeze, ["~> 0.53"])
    s.add_runtime_dependency(%q<google-apis-monitoring_v3>.freeze, ["~> 0.37"])
    s.add_runtime_dependency(%q<google-apis-dns_v1>.freeze, ["~> 0.28"])
    s.add_runtime_dependency(%q<google-apis-pubsub_v1>.freeze, ["~> 0.30"])
    s.add_runtime_dependency(%q<google-apis-sqladmin_v1beta4>.freeze, ["~> 0.38"])
    s.add_runtime_dependency(%q<google-cloud-env>.freeze, ["~> 1.2"])
    s.add_runtime_dependency(%q<addressable>.freeze, [">= 2.7.0"])
    s.add_development_dependency(%q<pry>.freeze, ["= 0.13.0"])
    s.add_development_dependency(%q<retriable>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_development_dependency(%q<minitest-reporters>.freeze, [">= 0"])
    s.add_development_dependency(%q<shindo>.freeze, [">= 0"])
    s.add_development_dependency(%q<vcr>.freeze, [">= 0"])
    s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
  else
    s.add_dependency(%q<fog-core>.freeze, ["< 2.3"])
    s.add_dependency(%q<fog-json>.freeze, ["~> 1.2"])
    s.add_dependency(%q<fog-xml>.freeze, ["~> 0.1.0"])
    s.add_dependency(%q<google-apis-storage_v1>.freeze, [">= 0.19", "< 1"])
    s.add_dependency(%q<google-apis-iamcredentials_v1>.freeze, ["~> 0.15"])
    s.add_dependency(%q<google-apis-compute_v1>.freeze, ["~> 0.53"])
    s.add_dependency(%q<google-apis-monitoring_v3>.freeze, ["~> 0.37"])
    s.add_dependency(%q<google-apis-dns_v1>.freeze, ["~> 0.28"])
    s.add_dependency(%q<google-apis-pubsub_v1>.freeze, ["~> 0.30"])
    s.add_dependency(%q<google-apis-sqladmin_v1beta4>.freeze, ["~> 0.38"])
    s.add_dependency(%q<google-cloud-env>.freeze, ["~> 1.2"])
    s.add_dependency(%q<addressable>.freeze, [">= 2.7.0"])
    s.add_dependency(%q<pry>.freeze, ["= 0.13.0"])
    s.add_dependency(%q<retriable>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<minitest-reporters>.freeze, [">= 0"])
    s.add_dependency(%q<shindo>.freeze, [">= 0"])
    s.add_dependency(%q<vcr>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
  end
end
