require 'fog/core/collection'
require 'fog/cloudstack/models/compute/public_ip_address'

module Fog
  module Cloudstack
    class Compute
      class PublicIpAddresses < Fog::Collection
        model Fog::Cloudstack::Compute::PublicIpAddress

        def all(options = {})
          response = service.list_public_ip_addresses(options)
          public_ip_addresses = response["listpublicipaddressesresponse"]["publicipaddress"] || []
          load(public_ip_addresses)
        end

        def get(address_id)
          response = service.list_public_ip_addresses('id' => address_id)
          if public_ip_address = response["listpublicipaddressesresponse"]["publicipaddress"].first
            new(public_ip_address)
          end
        rescue Fog::Cloudstack::Compute::BadRequest
          nil
        end
      end
    end
  end
end
