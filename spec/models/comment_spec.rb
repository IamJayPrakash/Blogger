# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'when comment is created' do
    it 'is created' do
      comments = FactoryBot.create(:comment)
      expect(comments).to be_valid
    end

    it 'associations' do
      expect(Comment.reflect_on_association(:post).macro).to eq(:belongs_to)
      expect(Comment.reflect_on_association(:user).macro).to eq(:belongs_to)
    end
  end
end
