

require 'fog/core/collection'
require 'fog/cloudstack/models/compute/network_offering'

module Fog
  module Cloudstack
    class Compute
      class NetworkOfferings < Fog::Collection
        model Fog::Cloudstack::Compute::NetworkOffering

        def all(filters={})
          options = get_filter_options(filters)
          data = service.list_network_offerings(options)["listnetworkofferingsresponse"]["networkoffering"] || []
          load(data)
        end

        def get(network_offering_id, filters={})
          filter_option = get_filter_options(filters)
          options = filter_option.merge('id' => network_offering_id)
          if data = service.list_network_offerings(options)["listnetworkofferingsresponse"]["networkoffering"].first
            new(data)
          end
        rescue Fog::Cloudstack::Compute::BadRequest
          nil
        end

        private

        def get_filter_options(filters)
          default_filter = {
              'projectfilter' => 'self'
          }
          default_filter.merge(filters)
        end
      end
    end
  end
end
