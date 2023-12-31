# frozen_string_literal: true

FactoryBot.define do
  factory :plant do
    scientific_name { Faker::Lorem.unique.sentence }
    common_name { Faker::Lorem.word }
    sun_exposure { Faker::Lorem.sentence(word_count: 3) }
    planting_time { Faker::Lorem.sentence(word_count: 4) }
    planting_method { Faker::Lorem.sentence(word_count: 4) }
    watering { Faker::Lorem.sentence(word_count: 3) }
    fertilization { Faker::Lorem.sentence(word_count: 6) }
    pruning { Faker::Lorem.sentence(word_count: 6) }
    harvest_timeline { Faker::Lorem.sentence(word_count: 3) }
    harvest_method { Faker::Lorem.sentence(word_count: 3) }
    pests { Faker::Lorem.sentence(word_count: 3) }
    homeopathic_remedies { Faker::Lorem.sentence(word_count: 3) }
    spacing { Faker::Lorem.sentence(word_count: 3) }
    other_notes { Faker::Lorem.sentence(word_count: 3) }
    plant_img { 'https://watchandlearn.scholastic.com/content/dam/classroom-magazines/watchandlearn/videos/animals-and-plants/plants/what-are-plants-/What-Are-Plants.jpg' }
  end
end
