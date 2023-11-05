# frozen_string_literal: true

module Fog
  module Compute
    class CloudAtCost
      class Real
        def create_server(cpu, ram, storage, template_id)
          body = { cpu: cpu.to_s, ram: ram.to_s, storage: storage.to_s, os: template_id.to_s }
          request(
            expects: [200],
            method: 'POST',
            path: 'api/v1/cloudpro/build.php',
            body: body
          )
        end
      end

      class Mock
        def create_server(_cpu, _ram, _storage, _template_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            'result'     => 'successful',
            'api'        => 'v1',
            'action'     => 'build',
            'status'     => 'ok',
            'taskid'     => 123_123_123_123,
            'time'       => 12_312_323
          }
          response
        end
      end
    end
  end
end
