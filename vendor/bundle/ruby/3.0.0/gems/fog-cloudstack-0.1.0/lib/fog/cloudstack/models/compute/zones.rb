require 'fog/core/collection'
require 'fog/cloudstack/models/compute/zone'

module Fog
  module Cloudstack
    class Compute
      class Zones < Fog::Collection
        model Fog::Cloudstack::Compute::Zone

        def all(filters={})
          options = {
            'templatefilter' => 'self'
          }.merge(filters)

          data = service.list_zones(options)["listzonesresponse"]["zone"] || []
          load(data)
        end

        def get(zone_id)
          if zone = service.list_zones('id' => zone_id)["listzonesresponse"]["zone"].first
            new(zone)
          end
        rescue Fog::Cloudstack::Compute::BadRequest
          nil
        end
      end
    end
  end
end
