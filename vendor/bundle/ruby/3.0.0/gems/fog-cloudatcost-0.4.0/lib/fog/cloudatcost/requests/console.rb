# frozen_string_literal: true

module Fog
  module Compute
    class CloudAtCost
      class Real
        def console(id)
          body = { sid: id.to_s }
          request(
            expects: [200],
            method: 'POST',
            path: 'api/v1/console.php',
            body: body
          )
        end
      end

      class Mock
        def console(_id, _hostname)
          console_url =
            'http:\/\/panel.cloudatcost.com:12345\/console.html?servername=123456&hostname=1.1.1.1'\
            '&sshkey=123456&sha1hash=aBcDeFgG'
          response = Excon::Response.new
          response.status = 200
          response.body = {
            'server_id'  => Fog::Mock.random_numbers(1).to_i,
            'api'        => 'v1',
            'status'     => 'ok',
            'console'    => console_url,
            'time'       => 12_312_323
          }
          response
        end
      end
    end
  end
end
