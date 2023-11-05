# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.sentence }
    association :user
    association :post
  end
end
