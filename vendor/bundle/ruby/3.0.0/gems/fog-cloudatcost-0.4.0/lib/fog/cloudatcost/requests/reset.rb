# frozen_string_literal: true

module Fog
  module Compute
    class CloudAtCost
      class Real
        def reset(id)
          body = { sid: id.to_s, action: 'reset' }
          request(
            expects: [200],
            method: 'POST',
            path: 'api/v1/powerop.php',
            body: body
          )
        end
      end

      class Mock
        def reset(_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            'server_id' => Fog::Mock.random_numbers(1).to_i,
            'api'        => 'v1',
            'status'     => 'ok',
            'result'     => 'successful',
            'action'     => 'reset',
            'time'       => 12_312_323,
            'taskid'     => 123_123_123_123
          }
          response
        end
      end
    end
  end
end
