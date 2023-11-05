# frozen_string_literal: true

class AddProfileImageToUsers < ActiveRecord::Migration[7.0]
  def change
    add_attachment :users, :profile_image
  end
end
