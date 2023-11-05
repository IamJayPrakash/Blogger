# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    # id { 5 }
    name { Faker::Name.name }
    # name { Faker::Lorem.word }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
