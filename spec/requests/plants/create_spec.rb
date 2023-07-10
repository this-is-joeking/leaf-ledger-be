require 'rails_helper'

RSpec.describe 'creating a new plant', :vcr do
  it 'returns all the details for a plant not in the database, plant passed as query param', :vcr do
    plant_name = 'Jalapeno'
    expected_keys = %i[scientific_name common_name sun_exposure planting_method planting_time watering
                       fertilization pruning harvest_method harvest_timeline pests homeopathic_remedies
                       spacing other_notes plant_img_url].sort

    expect(Plant.count).to eq(0)
    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }
    post("/api/v1/plants?name=#{plant_name}", headers:)

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
    expect(plant_data[:data][:attributes][:common_name]).to eq(plant_name)
  end

  it 'responds with an error message if an invalid plant name is passed' do
    plant_name = 'gibberishadfsdfgasdg'

    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }
    post("/api/v1/plants?name=#{plant_name}", headers:)

    error_message = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response).to have_http_status(422)
    expect(error_message).to be_a Hash
    expect(error_message.keys).to eq([:error])
    expect(error_message[:error].keys.sort).to eq(%i[code message].sort)
    expect(error_message[:error][:code]).to eq(422)
    expect(error_message[:error][:message]).to eq("Could not find any plant matching the name: #{plant_name}")
  end

  it 'responds with an error message if no name param is passed' do
    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }
    post('/api/v1/plants', headers:)

    error_message = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response).to have_http_status(422)
    expect(error_message).to be_a Hash
    expect(error_message.keys).to eq([:error])
    expect(error_message[:error].keys.sort).to eq(%i[code message].sort)
    expect(error_message[:error][:code]).to eq(422)
    expect(error_message[:error][:message]).to eq('Invalid request, no name param given')
  end

  it 'responds with an error message if no value for name param is passed' do
    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }
    post('/api/v1/plants?name=', headers:)

    error_message = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response).to have_http_status(422)
    expect(error_message).to be_a Hash
    expect(error_message.keys).to eq([:error])
    expect(error_message[:error].keys.sort).to eq(%i[code message].sort)
    expect(error_message[:error][:code]).to eq(422)
    expect(error_message[:error][:message]).to eq('Invalid request, no value for name param given')
  end
end
