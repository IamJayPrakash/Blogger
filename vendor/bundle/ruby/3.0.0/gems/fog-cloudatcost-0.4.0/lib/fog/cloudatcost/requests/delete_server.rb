# frozen_string_literal: true

module Fog
  module Compute
    class CloudAtCost
      class Real
        def delete_server(id)
          body = { sid: id.to_s }
          request(
            expects: [200],
            method: 'POST',
            path: 'api/v1/cloudpro/delete.php',
            body: body
          )
        end
      end

      class Mock
        def delete_server(_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            'result'     => 'successful',
            'api'        => 'v1',
            'action'     => 'delete',
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
