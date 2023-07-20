require 'rails_helper'

RSpec.describe 'User adding a plant to their garden', :vcr do
  it 'lets users add an existing plant to their garden' do
    user = create(:user)
    plant = create(:plant)
    expected_attributes = [:user_id, :date_planted, :plant_id, :user_notes, :created_at, :updated_at].sort
    expect(user.plants.count).to eq(0)
    post("/api/v1/users/#{user.id}/user_plants?plant_id=#{plant.id}")

    user_plant_data = JSON.parse(response.body, symbolize_names: true)
    
    expect(user.plants.count).to eq(1)
    expect(user.plants.first).to eq(plant)

    expect(response).to have_http_status(201)
    expect(user_plant_data.keys).to eq([:data])
    expect(user_plant_data[:data].keys.sort).to eq([:id, :type, :attributes].sort)
    expect(user_plant_data[:data][:id].to_i).to eq(UserPlant.first.id)
    expect(user_plant_data[:data][:type]).to eq('user_plant')
    expect(user_plant_data[:data][:attributes].keys.sort).to eq(expected_attributes)
    expect(user_plant_data[:data][:attributes][:user_id]).to eq(user.id)
    expect(user_plant_data[:data][:attributes][:plant_id]).to eq(plant.id)
    expect(user_plant_data[:data][:attributes][:user_notes]).to be nil
    expect(user_plant_data[:data][:attributes][:created_at]).to be_a String
    expect(user_plant_data[:data][:attributes][:updated_at]).to be_a String
    expect(user_plant_data[:data][:attributes][:created_at].to_datetime).to be_a DateTime
    expect(user_plant_data[:data][:attributes][:updated_at].to_datetime).to be_a DateTime
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
    expect(error_message[:error][:message]).to eq("Validation failed: Plant must exist")
  end
end