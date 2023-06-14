FactoryBot.define do
  factory :user do
    name { Faker::Movies::Lebowski.character }
    email { Faker::Internet.email(name:) }
  end
end
