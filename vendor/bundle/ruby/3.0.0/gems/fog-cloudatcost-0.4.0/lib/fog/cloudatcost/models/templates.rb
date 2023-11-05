# frozen_string_literal: true

require 'fog/core/collection'
require 'fog/cloudatcost/models/template'

module Fog
  module Compute
    class CloudAtCost
      class Templates < Fog::Collection
        model Fog::Compute::CloudAtCost::Template

        # Returns list of servers
        # @return [Fog::Compute::CloudAtCost::Templates]
        def all(_filters = {})
          data = service.list_templates.body['data']
          load(data)
        end

        # Retrieves server
        # @param [String] id for server to be returned
        # @return [Fog::Compute::CloudAtCost::Template]
        def get(id)
          service.templates.find do |_template|
            server.id != id
          end
        end
      end
    end
  end
end
