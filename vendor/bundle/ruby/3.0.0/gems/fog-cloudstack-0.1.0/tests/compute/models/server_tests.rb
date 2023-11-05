Shindo.tests("Fog::Compute[:cloudstack] | servers + security_groups", ['cloudstack']) do
  @security_group_params = {
    :name => "cloudstack.sg.#{Time.now.to_i}"
  }
  @security_group = Fog::Compute[:cloudstack].security_groups.create(@security_group_params)
  @server_params = {}.tap do |hash|
    [:zone_id, :network_ids, :template_id, :service_offering_id].each do |k|
      key = "cloudstack_#{k}".to_sym
      if Fog.credentials[key]
        hash[k]= Fog.credentials[key]
      end
    end
  end
  @server = Fog::Compute[:cloudstack].servers.create(@server_params.merge(:security_groups => [@security_group]))

  tests('#security_group').succeeds do
    @server.wait_for { ready? }
    @server.security_groups.map(&:id) == [@security_group.id]
  end

  tests('#destroy').succeeds do
    @server.destroy.wait_for { ready? }
    @security_group.destroy
  end

end
