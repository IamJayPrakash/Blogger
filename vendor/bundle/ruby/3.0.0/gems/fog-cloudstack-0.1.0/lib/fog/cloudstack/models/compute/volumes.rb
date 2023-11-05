require 'fog/core/collection'
require 'fog/cloudstack/models/compute/volume'

module Fog
  module Cloudstack
    class Compute
      class Volumes < Fog::Collection
        model Fog::Cloudstack::Compute::Volume

        def all(attributes = {})
          response = service.list_volumes(attributes)
          data = response["listvolumesresponse"]["volume"] || []
          load(data)
        end

        def get(volume_id)
          if volume = service.list_volumes('id' => volume_id)["listvolumesresponse"]["volume"].first
            new(volume)
          end
        rescue Fog::Cloudstack::Compute::BadRequest
          nil
        end
      end
    end
  end
end
