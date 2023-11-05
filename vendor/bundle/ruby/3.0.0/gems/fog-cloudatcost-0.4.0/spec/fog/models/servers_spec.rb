# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Fog::Compute::CloudAtCost::Servers do
  subject { Fog::Compute::CloudAtCost::Servers }

  it 'should have a collection of servers' do
    expect(subject.model).to eq(Fog::Compute::CloudAtCost::Server)
  end
end
