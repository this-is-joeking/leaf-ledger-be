# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Movies::Lebowski.character }
    email { Faker::Internet.email(name:) }
  end
end
