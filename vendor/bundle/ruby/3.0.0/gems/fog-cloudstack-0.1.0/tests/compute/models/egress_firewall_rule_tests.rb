Shindo.tests("Fog::Compute[:cloudstack] | egress_firewall_rule", ['cloudstack']) do
  @params = {
    :protocol => "tcp",
    :network_id => "8aacae29-e0a4-4b7b-8a7a-3ee11cfb4362",
    :cidr_list =>"10.1.1.0/24"
  }

  model_tests(Fog::Compute[:cloudstack].egress_firewall_rules, @params, true)
end
