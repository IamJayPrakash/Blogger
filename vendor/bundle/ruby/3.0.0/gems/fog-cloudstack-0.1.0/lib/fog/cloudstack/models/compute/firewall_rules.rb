require 'fog/core/collection'
require 'fog/cloudstack/models/compute/firewall_rule'

module Fog
  module Cloudstack
    class Compute
      class FirewallRules < Fog::Collection
        model Fog::Cloudstack::Compute::FirewallRule

        def all(options = {})
          response = service.list_firewall_rules(options)
          firewall_rules = response["listfirewallrulesresponse"]["firewallrule"] || []
          load(firewall_rules)
        end

        def get(address_id)
          options = { 'id' => address_id }
          response = service.list_firewall_rules(options)
          firewall_rules = response["listfirewallrulesresponse"]["firewallrule"].first
          new(firewall_rules)
        end
      end
    end
  end
end
