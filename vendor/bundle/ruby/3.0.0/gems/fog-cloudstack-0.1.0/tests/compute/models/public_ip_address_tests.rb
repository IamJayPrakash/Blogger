Shindo.tests("Fog::Compute[:cloudstack] | public_ip_address", ['cloudstack']) do
  @params = {}.tap do |hash|
    [:zone_id].each do |k|
      key = "cloudstack_#{k}".to_sym
      if Fog.credentials[key]
        hash[k]= Fog.credentials[key]
      end
    end
  end

  @server_attributes = {}.tap do |hash|
    [:zone_id, :network_ids, :template_id, :service_offering_id].each do |k|
      key = "cloudstack_#{k}".to_sym
      if Fog.credentials[key]
        hash[k]= Fog.credentials[key]
      end
    end
  end

  model_tests(Fog::Compute[:cloudstack].public_ip_addresses, @params, true) do
    @server = Fog::Compute[:cloudstack].servers.create(@server_attributes)
    @server.wait_for { ready? }

    tests('#server=').succeeds do
      @instance.server = @server
    end

    tests('#server') do
      test(' == @server') do
        @instance.reload
        @instance.server_id == @server.id
      end
    end

    test('#server = nil') do
      @instance.server = nil
      @instance.server_id.nil?
    end

    @server.destroy
  end
end
