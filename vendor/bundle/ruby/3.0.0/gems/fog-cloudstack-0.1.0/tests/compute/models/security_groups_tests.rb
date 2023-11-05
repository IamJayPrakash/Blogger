Shindo.tests("Fog::Compute[:cloudstack] | security_group", ['cloudstack']) do
  @params = {
    :name => "cloudstack.sg.#{Time.now.to_i}"
  }

  collection_tests(Fog::Compute['cloudstack'].security_groups, @params, true) do
    responds_to(:rules)
  end
end
