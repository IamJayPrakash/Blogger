Shindo.tests("Fog::Compute[:cloudstack] | disk_offering", ['cloudstack']) do
  @params = {
    :name => "new disk offering",
    :display_text => 'New Disk Offering'
  }
  model_tests(Fog::Compute[:cloudstack].disk_offerings, @params, true)
end
