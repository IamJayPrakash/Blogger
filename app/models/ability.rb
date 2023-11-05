# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.persisted? && user.role.present?
      case user.role
      when 'admin'
        can :manage, :all
      when 'editor'

        can :read, :all
        can :create, Post
        can :create, Comment
        can :edit, Post
        can :update, Post
        can :like, Post
        can :destroy, Post do |post|
          post.user == user
        end
        can :update, Comment do |comment|
          comment.user == user
        end
        can :edit, Comment do |comment|
          comment.user == user
        end
        can :destroy, Comment do |comment|
          comment.user == user
        end
      when 'normal_user'
        can :read, :all
        can :create, Post
        can :create, Comment
        can :like, Post

        can :edit, Post do |p|
          p.user == user
        end
        can :update, Post do |p|
          p.user == user
        end
        can :destroy, Post do |post|
          post.user == user
        end
        can :edit, Comment do |comment|
          comment.user == user
        end
        can :destroy, Comment do |comment|
          comment.user == user
        end

        can :update, Comment do |comment|
          comment.user == user
        end
      end
    else
      # Default case
      can :read, :all
    end
  end
end
