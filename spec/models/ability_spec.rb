# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Ability, type: :model do
  # it 'is created' do
  #   user = FactoryBot.create(:user)
  #   # post = FactoryBot.create(:post)
  #   # expect(post).to be_valid
  #   expect(user).to be_valid
  # end

  it 'has the correct abilities for admin' do
    # for admin user
    user = FactoryBot.create(:user, role: 'admin')
    ability = Ability.new(user)
    assert ability.can? :manage, :all
  end

  it 'has the correct abilities for editor' do
    # for editior role
    user = FactoryBot.create(:user, role: 'editor')

    ability = Ability.new(user)
    assert ability.can? :read, :all
    assert ability.can? :create, Post
    assert ability.can? :create, Comment
    assert ability.can? :edit, Post
    assert ability.can? :update, Post
    assert ability.can? :like, Post
    assert ability.can?(:destroy, Post) do |post|
      post.user == user
    end

    assert ability.can?(:update, Comment) do |comment|
      comment.user == user
    end
    assert ability.can?(:edit, Comment) do |comment|
      comment.user == user
    end
    assert ability.can?(:destroy, Comment) do |comment|
      comment.user == user
    end
  end

  it 'has the correct abilities for noraml suer' do
    # for normal user
    user = FactoryBot.create(:user, role: 'normal_user')
    ability = Ability.new(user)
    assert ability.can? :read, :all
    assert ability.can? :create, Post
    assert ability.can? :create, Comment
    assert ability.can? :like, Post
    assert ability.can?(:edit, Post) do |post|
      post.user == user
    end
    assert ability.can?(:update, Post) do |post|
      post.user == user
    end
    assert ability.can?(:destroy, Post) do |post|
      post.user == user
    end
    assert ability.can?(:edit, Comment) do |comment|
      comment.user == user
    end
    assert ability.can?(:destroy, Comment) do |comment|
      comment.user == user
    end
    assert ability.can?(:update, Comment) do |comment|
      comment.user == user
    end
  end

  it 'has the correct abilities for no role user' do
    # for no role
    user3 = FactoryBot.create(:user, role: '')
    ability = Ability.new(user3)
    assert ability.can? :read, :all
  end
end
