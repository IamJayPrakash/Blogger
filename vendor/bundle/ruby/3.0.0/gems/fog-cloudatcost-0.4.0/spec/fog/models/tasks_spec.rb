# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Fog::Compute::CloudAtCost::Tasks do
  subject { Fog::Compute::CloudAtCost::Tasks }

  it 'should have a collection of tasks' do
    expect(subject.model).to eq(Fog::Compute::CloudAtCost::Task)
  end
end
