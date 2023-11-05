# frozen_string_literal: true

require 'fog/core'
require 'fog/json'

require_relative 'cloudatcost/version'

module Fog
  module CloudAtCost
    extend Fog::Provider
    service(:compute, 'Compute')
  end

  module Compute
    autoload :CloudAtCost, File.expand_path('../cloudatcost/compute', __FILE__)
  end
end
