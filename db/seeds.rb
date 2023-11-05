# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: 'jp@example.com', password: 'password', password_confirmation: 'password')
User.create(email: 'pj@example.com', name: 'Jp', password: 'password', password_confirmation: 'password')
10.times do |x|
  Post.create(title: "title #{x}", body: "body of #{x} goes here", user_id: User.first.id)
end
# Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email"))
