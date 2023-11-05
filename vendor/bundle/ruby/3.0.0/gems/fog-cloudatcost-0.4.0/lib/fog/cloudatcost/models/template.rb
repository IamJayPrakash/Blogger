# frozen_string_literal: true

module Fog
  module Compute
    class CloudAtCost
      class Template < Fog::Model
        identity :ce_id
        attribute :name
      end
    end
  end
end
