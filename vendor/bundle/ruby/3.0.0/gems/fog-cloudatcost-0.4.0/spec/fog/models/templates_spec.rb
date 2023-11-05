# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Fog::Compute::CloudAtCost::Templates do
  subject { Fog::Compute::CloudAtCost::Templates }

  it 'should have a collection of templates' do
    expect(subject.model).to eq(Fog::Compute::CloudAtCost::Template)
  end
end
