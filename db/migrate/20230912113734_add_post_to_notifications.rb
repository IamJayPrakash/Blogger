# frozen_string_literal: true

class AddPostToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_reference :notifications, :post, foreign_key: true
  end
end
