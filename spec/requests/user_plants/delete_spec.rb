# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'deleting a user_plant', :vcr do
  it 'deletes the user plant' do
    user = create(:user)
    plant = create(:plant)
    up = UserPlant.create(user:, plant:)

    expect(user.plants).to eq([plant])

    delete("/api/v1/users/#{user.id}/user_plants/#{up.id}")

    expect(User.find(user.id).plants).to eq([])
    expect(UserPlant.exists?(up.id)).to be false
    expect(response).to have_http_status(204)
    expect(response.body).to eq('')
  end

  it 'returns an appropriate error message if given user plant that does not belong to user' do
    user1 = create(:user)
    user2 = create(:user)
    plant = create(:plant)
    up = UserPlant.create(user: user1, plant:)

    delete("/api/v1/users/#{user2.id}/user_plants/#{up.id}")

    error_message = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(403)
    expect(error_message.keys).to eq([:error])
    expect(error_message[:error].keys.sort).to eq(%i[code message].sort)
    expect(error_message[:error][:code]).to eq(403)
    expect(error_message[:error][:message]).to eq("UserPlant #{up.id} does not belong to user #{user2.id}")
  end

  it 'returns an appropriate error message if passed an invalid user plant id' do
    user = create(:user)
    bad_id = 1

    delete("/api/v1/users/#{user.id}/user_plants/#{bad_id}")

    error_message = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(404)
    expect(error_message.keys).to eq([:error])
    expect(error_message[:error].keys.sort).to eq(%i[code message].sort)
    expect(error_message[:error][:code]).to eq(404)
    expect(error_message[:error][:message]).to eq("Couldn't find UserPlant with 'id'=#{bad_id}")
  end

  it 'returns an appropriate error message if passed an invalid user id' do
    delete('/api/v1/users/1/user_plants/1')

    error_message = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(404)
    expect(error_message.keys).to eq([:error])
    expect(error_message[:error].keys.sort).to eq(%i[code message].sort)
    expect(error_message[:error][:code]).to eq(404)
    expect(error_message[:error][:message]).to eq("Couldn't find User with 'id'=1")
  end
end
