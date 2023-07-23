# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'delete a user', :vcr do
  it 'deletes a user and all of their user_plants' do
    user = create(:user)
    plants = create_list(:plant, 5)
    plants.each do |plant|
      UserPlant.create!(user:, plant:)
    end
    expect(UserPlant.count).to eq(5)
    expect(Plant.count).to eq(5)

    delete("/api/v1/users/#{user.id}")

    expect(User.exists?(user.id)).to be false
    expect(UserPlant.count).to eq(0)
    expect(Plant.count).to eq(5)
    expect(response).to have_http_status(204)
    expect(response.body).to eq('')
  end

  it 'returns an appropriate error message if an invalid user id is passed' do
    delete('/api/v1/users/1')

    error_message = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(404)
    expect(error_message.keys).to eq([:error])
    expect(error_message[:error].keys.sort).to eq(%i[code message].sort)
    expect(error_message[:error][:code]).to eq(404)
    expect(error_message[:error][:message]).to eq("Couldn't find User with 'id'=1")
  end
end
