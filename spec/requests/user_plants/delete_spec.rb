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
end
