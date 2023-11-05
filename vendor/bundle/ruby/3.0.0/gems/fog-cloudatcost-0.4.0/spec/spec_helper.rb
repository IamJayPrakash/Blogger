# frozen_string_literal: true

require 'rspec'
require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
end

require 'fog/cloudatcost'
