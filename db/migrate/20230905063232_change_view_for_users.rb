# frozen_string_literal: true

class ChangeViewForUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :views, :integer, default: 0
    # Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
