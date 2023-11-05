# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'associations' do
    expect(Like.reflect_on_association(:post).macro).to eq(:belongs_to)
    expect(Like.reflect_on_association(:user).macro).to eq(:belongs_to)
  end
end
