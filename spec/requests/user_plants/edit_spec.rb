# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'editing a users plants', :vcr do
  it 'allows users to update the notes and planted at date' do
    user = create(:user)
    plant = create(:plant)
    up = UserPlant.create!(user:, plant:)
    expected_attributes = %i[user_id date_planted plant_id user_notes created_at updated_at].sort
    user_notes = 'I could not keep this plant alive last year'
    date_planted = '2023-07-20'

    expect(user.plants).to eq([plant])
    expect(up.user_notes).to be nil

    params = { 'user_notes' => user_notes,
               'date_planted' => date_planted }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    patch("/api/v1/users/#{user.id}/user_plants/#{up.id}", headers:, params: JSON.generate(params))

    user_plant_data = JSON.parse(response.body, symbolize_names: true)
    require 'pry'
    binding.pry
    expect(UserPlant.find(up.id).user_notes).to eq(user_notes)
    expect(UserPlant.find(up.id).date_planted).to eq(Date.parse(date_planted))

    expect(response).to have_http_status(200)
    expect(user_plant_data.keys).to eq([:data])
    expect(user_plant_data[:data].keys.sort).to eq(%i[id type attributes].sort)
    expect(user_plant_data[:data][:id].to_i).to eq(up.id)
    expect(user_plant_data[:data][:type]).to eq('user_plant')
    expect(user_plant_data[:data][:attributes].keys.sort).to eq(expected_attributes)
    expect(user_plant_data[:data][:attributes][:user_id]).to eq(user.id)
    expect(user_plant_data[:data][:attributes][:plant_id]).to eq(plant.id)
    expect(user_plant_data[:data][:attributes][:user_notes]).to eq(user_notes)
    expect(user_plant_data[:data][:attributes][:date_planted]).to eq(date_planted)
    expect(Date.parse(user_plant_data[:data][:attributes][:date_planted])).to be_a Date
    expect(user_plant_data[:data][:attributes][:created_at]).to be_a String
    expect(user_plant_data[:data][:attributes][:updated_at]).to be_a String
    expect(user_plant_data[:data][:attributes][:created_at].to_datetime).to be_a DateTime
    expect(user_plant_data[:data][:attributes][:updated_at].to_datetime).to be_a DateTime
  end

  it 'returns with an appropriate error message if an invalid user plant id is passed' do
    user = create(:user)
    plant = create(:plant)
    up = UserPlant.create!(user:, plant:)

    user_notes = 'I could not keep this plant alive last year'
    bad_id = up.id + 1

    params = { 'user_notes' => user_notes }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    patch("/api/v1/users/#{user.id}/user_plants/#{bad_id}", headers:, params: JSON.generate(params))

    error_message = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(404)
    expect(error_message.keys).to eq([:error])
    expect(error_message[:error].keys.sort).to eq(%i[code message].sort)
    expect(error_message[:error][:code]).to eq(404)
    expect(error_message[:error][:message]).to eq("Couldn't find UserPlant with 'id'=#{bad_id}")
  end

  it 'returns an appropriate error message if user plant id passed does not belong to user' do
    user1 = create(:user)
    user2 = create(:user)
    plant = create(:plant)
    up = UserPlant.create!(user: user1, plant:)

    user_notes = 'I could not keep this plant alive last year'

    params = { 'user_notes' => user_notes }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    patch("/api/v1/users/#{user2.id}/user_plants/#{up.id}", headers:, params: JSON.generate(params))

    error_message = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(403)
    expect(error_message.keys).to eq([:error])
    expect(error_message[:error].keys.sort).to eq(%i[code message].sort)
    expect(error_message[:error][:code]).to eq(403)
    expect(error_message[:error][:message]).to eq("UserPlant #{up.id} does not belong to user #{user2.id}")
  end
end
