# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User adding a plant to their garden', :vcr do
  it 'lets users add an existing plant to their garden' do
    user = create(:user)
    plant = create(:plant)
    expected_attributes = %i[date_planted user_notes created_at updated_at].sort

    expect(user.plants.count).to eq(0)

    post("/api/v1/users/#{user.id}/user_plants?plant_id=#{plant.id}")

    user_plant_data = JSON.parse(response.body, symbolize_names: true)

    expect(user.plants.count).to eq(1)
    expect(user.plants.first).to eq(plant)

    expect(response).to have_http_status(201)
    expect(user_plant_data.keys).to eq([:data])
    expect(user_plant_data[:data].keys.sort).to eq(%i[id type attributes relationships].sort)
    expect(user_plant_data[:data][:id].to_i).to eq(UserPlant.first.id)
    expect(user_plant_data[:data][:type]).to eq('user_plant')
    expect(user_plant_data[:data][:attributes].keys.sort).to eq(expected_attributes)
    expect(user_plant_data[:data][:attributes][:user_notes]).to be nil
    expect(user_plant_data[:data][:attributes][:date_planted]).to be nil
    expect(user_plant_data[:data][:attributes][:created_at]).to be_a String
    expect(user_plant_data[:data][:attributes][:updated_at]).to be_a String
    expect(user_plant_data[:data][:attributes][:created_at].to_datetime).to be_a DateTime
    expect(user_plant_data[:data][:attributes][:updated_at].to_datetime).to be_a DateTime
    expect(user_plant_data[:data][:relationships].keys).to eq([:plant])
    expect(user_plant_data[:data][:relationships][:plant].keys).to eq([:data])
    expect(user_plant_data[:data][:relationships][:plant][:data].keys.sort).to eq(%i[id type])
    expect(user_plant_data[:data][:relationships][:plant][:data][:type]).to eq('plant')
    expect(user_plant_data[:data][:relationships][:plant][:data][:id].to_i).to eq(plant.id)
  end

  it 'responds with appropriate error message if invalid plant id is sent' do
    user = create(:user)
    plant_id = 1
    expect(user.plants.count).to eq(0)
    post("/api/v1/users/#{user.id}/user_plants?plant_id=#{plant_id}")

    error_message = JSON.parse(response.body, symbolize_names: true)

    expect(user.plants.count).to eq(0)
    expect(response).to have_http_status(422)
    expect(error_message.keys).to eq([:error])
    expect(error_message[:error].keys.sort).to eq(%i[code message].sort)
    expect(error_message[:error][:code]).to eq(422)
    expect(error_message[:error][:message]).to eq('Validation failed: Plant must exist')
  end

  it 'responds with appropriate error message if invalid user id is sent' do
    user_id = 1
    plant = create(:plant)
    expect(plant.users.count).to eq(0)
    post("/api/v1/users/#{user_id}/user_plants?plant_id=#{plant.id}")

    error_message = JSON.parse(response.body, symbolize_names: true)

    expect(plant.users.count).to eq(0)
    expect(response).to have_http_status(422)
    expect(error_message.keys).to eq([:error])
    expect(error_message[:error].keys.sort).to eq(%i[code message].sort)
    expect(error_message[:error][:code]).to eq(422)
    expect(error_message[:error][:message]).to eq('Validation failed: User must exist')
  end

  it 'responds with appropriate error message if user and plant id are invalid' do
    user_id = 1
    plant_id = 1

    post("/api/v1/users/#{user_id}/user_plants?plant_id=#{plant_id}")

    error_message = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(422)
    expect(error_message.keys).to eq([:error])
    expect(error_message[:error].keys.sort).to eq(%i[code message].sort)
    expect(error_message[:error][:code]).to eq(422)
    expect(error_message[:error][:message]).to eq('Validation failed: User must exist, Plant must exist')
  end
end
