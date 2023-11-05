# frozen_string_literal: true

module Fog
  module Compute
    class CloudAtCost
      class Real
        def reverse_dns(id, host_name)
          body = { sid: id.to_s, hostname: host_name.to_s }
          request(
            expects: [200],
            method: 'POST',
            path: 'api/v1/rdns.php',
            body: body
          )
        end
      end

      class Mock
        def reverse_dns(_id, _hostname)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            'server_id' => Fog::Mock.random_numbers(1).to_i,
            'api'        => 'v1',
            'status'     => 'ok',
            'result'     => 'successful',
            'time'       => 12_312_323
          }
          response
        end
      end
    end
  end
end
