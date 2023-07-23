# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user_plant show request', :vcr do
  it 'returns details about the user_plant and associated plant' do
    user = create(:user)
    plant = create(:plant)
    up = UserPlant.create(user:, plant:, user_notes: 'my first plant', date_planted: '2023-04-01')
    expected_keys = %i[date_planted user_notes created_at updated_at].sort
    expected_plant_keys = %i[scientific_name common_name sun_exposure planting_method planting_time watering
                             fertilization pruning harvest_method harvest_timeline pests homeopathic_remedies
                             spacing other_notes plant_img_url].sort

    get("/api/v1/users/#{user.id}/user_plants/#{up.id}")

    user_plant_data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(200)
    expect(user_plant_data.keys.sort).to eq(%i[data included])
    expect(user_plant_data[:data].keys.sort).to eq(%i[type id attributes relationships].sort)
    expect(user_plant_data[:data][:type]).to eq('user_plant')
    expect(user_plant_data[:data][:id].to_i).to eq(up.id)
    expect(user_plant_data[:data][:attributes].keys.sort).to eq(expected_keys)
    expect(user_plant_data[:data][:attributes][:date_planted]).to eq('2023-04-01')
    expect(user_plant_data[:data][:attributes][:user_notes]).to eq('my first plant')
    expect(user_plant_data[:data][:attributes][:created_at]).to be_a String
    expect(user_plant_data[:data][:attributes][:updated_at]).to be_a String
    expect(user_plant_data[:data][:attributes][:created_at].to_datetime).to be_a DateTime
    expect(user_plant_data[:data][:attributes][:updated_at].to_datetime).to be_a DateTime
    expect(user_plant_data[:data][:relationships].keys).to eq([:plant])
    expect(user_plant_data[:data][:relationships][:plant].keys).to eq(%i[data])
    expect(user_plant_data[:data][:relationships][:plant][:data].keys.sort).to eq(%i[type id].sort)
    expect(user_plant_data[:data][:relationships][:plant][:data][:type]).to eq('plant')
    expect(user_plant_data[:data][:relationships][:plant][:data][:id].to_i).to eq(plant.id)
    expect(user_plant_data[:included]).to be_an Array
    expect(user_plant_data[:included].count).to eq(1)
    expect(user_plant_data[:included].first.keys.sort).to eq(%i[type id attributes].sort)
    expect(user_plant_data[:included].first[:type]).to eq('plant')
    expect(user_plant_data[:included].first[:id].to_i).to eq(plant.id)
    expect(user_plant_data[:included].first[:attributes].keys.sort).to eq(expected_plant_keys)
    expected_plant_keys.each do |key|
      expect(user_plant_data[:included].first[:attributes][key]).to be_a String
    end
  end

  it 'returns an appropriate error if an invalid user plant and user id is requested' do
    get("/api/v1/users/1/user_plants/1")

    error_message = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(404)
    expect(error_message.keys).to eq([:error])
    expect(error_message[:error].keys.sort).to eq(%i[code message].sort)
    expect(error_message[:error][:code]).to eq(404)
    expect(error_message[:error][:message]).to eq("Couldn't find User with 'id'=1")
  end

  it 'returns appropriate error message if user plant does not belong to user' do
    user1 = create(:user)
    user2 = create(:user)
    plant = create(:plant)
    up = UserPlant.create(user: user1, plant:)

    get("/api/v1/users/#{user2.id}/user_plants/#{up.id}")
    error_message = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(403)
    expect(error_message.keys).to eq([:error])
    expect(error_message[:error].keys.sort).to eq(%i[code message].sort)
    expect(error_message[:error][:code]).to eq(403)
    expect(error_message[:error][:message]).to eq("UserPlant #{up.id} does not belong to user #{user2.id}")
  end
end
