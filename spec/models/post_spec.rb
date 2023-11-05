# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'when post is created' do
    it 'is created' do
      post = FactoryBot.create(:post)
      expect(post).to be_valid
    end

    it 'associations' do
      expect(Post.reflect_on_association(:comments).macro).to eq(:has_many)
      expect(Post.reflect_on_association(:users).macro).to eq(:has_many)
      expect(Post.reflect_on_association(:likes).macro).to eq(:has_many)
    end
  end
end
