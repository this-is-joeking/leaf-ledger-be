# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'plant details', :vcr do
  it 'returns all the details for a plant in the database' do
    plant = create(:plant, common_name: 'Jalapeno')
    expected_keys = %i[scientific_name common_name sun_exposure planting_method planting_time watering
                       fertilization pruning harvest_method harvest_timeline pests homeopathic_remedies spacing other_notes].sort

    expect(Plant.count).to eq(1)
    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }
    get("/api/v1/plants/#{plant.id}", headers:)

    plant_data = JSON.parse(response.body, symbolize_names: true)

    expect(Plant.count).to eq(1)
    expect(response).to be_successful
    expect(plant_data).to be_a Hash
    expect(plant_data.keys).to eq([:data])
    expect(plant_data[:data]).to be_a Hash
    expect(plant_data[:data].keys.sort).to eq(%i[type id attributes].sort)
    expect(plant_data[:data][:id]).to be_a String
    expect(plant_data[:data][:id].to_i).to be_a Integer
    expect(plant_data[:data][:type]).to eq('plant')
    expect(plant_data[:data][:attributes]).to be_a Hash
    expect(plant_data[:data][:attributes].keys.sort).to eq(expected_keys)
    expected_keys.each do |key|
      expect(plant_data[:data][:attributes][key]).to be_a String
    end
    expect(plant_data[:data][:attributes][:common_name]).to eq(plant.common_name)
  end

  it 'provides an error message for invalid id' do
    plant = create(:plant, common_name: 'jalapeno')
    invalid_id = plant.id + 1

    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }
    get("/api/v1/plants/#{invalid_id}", headers:)

    error_message = JSON.parse(response.body, symbolize_names: true)

    expect(Plant.count).to eq(1)
    expect(response).not_to be_successful
    expect(response).to have_http_status(404)
    expect(error_message).to be_a Hash
    expect(error_message.keys).to eq([:error])
    expect(error_message[:error].keys.sort).to eq(%i[code message].sort)
    expect(error_message[:error][:code]).to eq(404)
    expect(error_message[:error][:message]).to eq("Couldn't find Plant with 'id'=#{invalid_id}")
  end
end
