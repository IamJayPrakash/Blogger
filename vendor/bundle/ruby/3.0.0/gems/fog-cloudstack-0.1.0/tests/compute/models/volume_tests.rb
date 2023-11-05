def volume_tests(connection, params, mocks_implemented = true)
  model_tests(connection.volumes, params[:volume_attributes], mocks_implemented) do
    if !Fog.mocking? || mocks_implemented
      @instance.wait_for { ready? }
    end

    @server = @instance.service.servers.create(params[:server_attributes])
    @server.wait_for { ready? }

    tests('attach').succeeds do
      @instance.attach(@server)
    end

    tests('detach').succeeds do
      @instance.detach
    end

    @server.destroy
  end
end

Shindo.tests("Fog::Compute[:cloudstack] | volume", ['cloudstack']) do
  @params = {
    :volume_attributes => {:name => "somevolume"}.tap do |hash|
      [:zone_id, :disk_offering_id].each do |k|
        key = "cloudstack_#{k}".to_sym
        if Fog.credentials[key]
          hash[k]= Fog.credentials[key]
        end
      end
    end,
    :server_attributes => {}.tap do |hash|
      [:zone_id, :network_ids, :template_id, :service_offering_id].each do |k|
        key = "cloudstack_#{k}".to_sym
        if Fog.credentials[key]
          hash[k]= Fog.credentials[key]
        end
      end
    end
  }

  volume_tests(Fog::Compute[:cloudstack], @params, true) do
    responds_to(:ready?)
    responds_to(:flavor)
  end
end
