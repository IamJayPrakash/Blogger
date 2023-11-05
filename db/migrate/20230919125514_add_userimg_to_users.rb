# frozen_string_literal: true

class AddUserimgToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :userimage, :string
  end
end
