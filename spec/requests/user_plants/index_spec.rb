# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user plant index request', :vcr do
  it 'returns all of a users user plants and their plants' do
    user = create(:user)
    plant_count = 3
    plants = create_list(:plant, plant_count)
    expected_up_attributes = %i[user_notes date_planted updated_at created_at].sort
    expected_plant_attributes = %i[scientific_name common_name sun_exposure planting_time planting_method
                                   watering fertilization pruning harvest_timeline harvest_method pests homeopathic_remedies spacing other_notes plant_img_url].sort

    plants.each do |plant|
      UserPlant.create(user:, plant:)
    end

    get("/api/v1/users/#{user.id}/user_plants")

    user_plants_data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(200)
    expect(user_plants_data.keys.sort).to eq(%i[data included].sort)
    expect(user_plants_data[:data]).to be_an Array
    expect(user_plants_data[:data].count).to eq(plant_count)
    user_plants_data[:data].each do |user_plant|
      expect(user_plant.keys.sort).to eq(%i[id type attributes relationships].sort)
      expect(user_plant[:id]).to be_a String
      expect(user_plant[:type]).to eq('user_plant')
      expect(user_plant[:attributes].keys.sort).to eq(expected_up_attributes)
      expect(user_plant[:relationships].keys).to eq([:plant])
      expect(user_plant[:relationships][:plant].keys).to eq([:data])
      expect(user_plant[:relationships][:plant][:data].keys).to eq(%i[id type])
    end
    expect(user_plants_data[:included]).to be_an Array
    expect(user_plants_data[:included].count).to eq(plant_count)
    user_plants_data[:included].each do |plant|
      expect(plant.keys.sort).to eq(%i[id type attributes].sort)
      expect(plant[:id]).to be_a String
      expect(plant[:type]).to eq('plant')
      expect(plant[:attributes].keys.sort).to eq(expected_plant_attributes)
    end
  end

  it 'returns an appropriate error message if given an invalid user_id' do
    get '/api/v1/users/1/user_plants'

    error_message = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(404)
    expect(error_message.keys).to eq([:error])
    expect(error_message[:error].keys.sort).to eq(%i[code message].sort)
    expect(error_message[:error][:code]).to eq(404)
    expect(error_message[:error][:message]).to eq("Couldn't find User with 'id'=1")
  end
end
