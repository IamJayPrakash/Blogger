
require 'fog/core/collection'
require 'fog/cloudstack/models/compute/network'

module Fog
  module Cloudstack
    class Compute
      class Networks < Fog::Collection
        model Fog::Cloudstack::Compute::Network

        def all(filters={})
          options = get_filter_options(filters)
          data = service.list_networks(options)["listnetworksresponse"]["network"] || []
          load(data)
        end

        def get(network_id, filters={})
          filter_option = get_filter_options(filters)
          options = filter_option.merge('id' => network_id)
          if data = service.list_networks(options)["listnetworksresponse"]["network"].first
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
