# frozen_string_literal: true

class AddViewsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :views, :integer
  end
end
