# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'When a user is created' do
    let(:user) { build :user }
    let(:user1) { build :user, name: user.name, email: user.email }

    it 'Should be a valid user with all attributes' do
      expect(user).to be_valid
    end

    it 'Error if a duplicate user is created' do
      user.save
      expect(user1.save).to eq(false)
      expect { user1.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'associations' do
      expect(User.reflect_on_association(:comments).macro).to eq(:has_many)
      expect(User.reflect_on_association(:posts).macro).to eq(:has_many)
      expect(User.reflect_on_association(:likes).macro).to eq(:has_many)
    end

    describe '#active?' do
      it 'returns true if plan is lifetime' do
        user.plan = 'lifetime'
        expect(user.active?).to eq(true)
      end

      it 'returns false if subscription_ends_at is not present' do
        user.plan = 'monthly'
        user.subscription_ends_at = nil
        expect(user.active?).to eq(false)
      end

      it 'returns true if subscription_ends_at is in the future' do
        user.plan = 'monthly'
        user.subscription_ends_at = Time.zone.now + 1.day
        expect(user.active?).to eq(true)
      end

      it 'returns false if subscription_ends_at is in the past' do
        user.plan = 'monthly'
        user.subscription_ends_at = Time.zone.now - 1.day
        expect(user.active?).to eq(false)
      end
    end

    describe '.from_omniauth' do
      let(:auth) do
        OmniAuth::AuthHash.new(
          provider: 'facebook',
          uid: '123456',
          info: {
            email: 'jay@gmail.com',
            name: 'jay Prakash'
          }
        )
      end

      it 'creates a new user with the provided attributes' do
        expect do
          user = User.from_omniauth(auth)
          expect(user.email).to eq('jay@gmail.com')
          expect(user.name).to eq('jay Prakash')
        end.to change(User, :count).by(1)
      end

      it 'skips confirmation for the created user' do
        user = User.from_omniauth(auth)
        expect(user.confirmed?).to eq(true)
      end
    end
  end
end
