Shindo.tests("Fog::Compute[:cloudstack] | security_group_rules | ingress", ['cloudstack']) do
  @security_group = Fog::Compute[:cloudstack].security_groups.create({:name => "cloudstack.sg.#{Time.now.to_i}"})
  @params = {
    :cidr => '0.0.0.0/0',
    :start_port => 123,
    :end_port => 456,
    :protocol => 'tcp',
    :security_group_id => @security_group.id,
    :direction => 'ingress'
  }

  model_tests(Fog::Compute[:cloudstack].security_group_rules, @params, true)

  @security_group.destroy
end

Shindo.tests("Fog::Compute[:cloudstack] | security_group_rules | egress", ['cloudstack']) do
  @security_group = Fog::Compute[:cloudstack].security_groups.create({:name => "cloudstack.sg.#{Time.now.to_i}"})
  @params = {
    :cidr => '0.0.0.0/0',
    :start_port => 123,
    :end_port => 456,
    :protocol => 'tcp',
    :security_group_id => @security_group.id,
    :direction => 'egress'
  }   

  model_tests(Fog::Compute[:cloudstack].security_group_rules, @params, true)

  @security_group.destroy
end
