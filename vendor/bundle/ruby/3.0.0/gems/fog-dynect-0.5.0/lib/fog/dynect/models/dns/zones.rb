require 'fog/dynect/models/dns/zone'

module Fog
  module Dynect
    class DNS
      class Zones < Fog::Collection
        model Fog::Dynect::DNS::Zone

        def all
          data = service.get_zone.body['data'].map do |zone|
            { :domain => zone }
          end
          load(data)
        end

        def get(zone_id)
          new(service.get_zone('zone' => zone_id).body['data'])
        rescue Excon::Errors::NotFound
          nil
        end
      end
    end
  end
end
