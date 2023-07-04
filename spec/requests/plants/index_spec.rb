# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'plant index' do
  it 'returns an array of all plants in the database' do
    create_list(:plant, 5)

    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }
    get('/api/v1/plants/', headers:)

    plant_data = JSON.parse(response.body, symbolize_names: true)

    expect(Plant.count).to eq(5)
    expect(response).to have_http_status(200)
    expect(plant_data).to be_a Hash
    expect(plant_data.keys).to eq([:data])
    expect(plant_data[:data]).to be_a Array
    expect(plant_data[:data].count).to eq(5)
    plant_data[:data].each do |plant|
      expect(plant).to be_a Hash
      expect(plant.keys.sort).to eq(%i[id type attributes].sort)
      expect(plant[:id].to_i).to be_a Integer
      expect(plant[:type]).to eq('plant')
      expect(plant[:attributes]).to be_a Hash
      expect(plant[:attributes]).to have_key(:scientific_name)
      expect(plant[:attributes]).to have_key(:common_name)
    end
  end

  it 'returns paginated response with 25 items per page' do
    create_list(:plant, 30)
    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }
    get('/api/v1/plants/', headers:)

    plant_data1 = JSON.parse(response.body, symbolize_names: true)

    expect(Plant.count).to eq(30)
    expect(response).to have_http_status(200)
    expect(plant_data1[:data].count).to eq(25)
    expect(response.header['Per-Page']).to eq('25')
    expect(response.header).to have_key('Link')
    expect(response.header['Total']).to eq('30')

    get('/api/v1/plants?page=2', headers:)
    plant_data2 = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status(200)
    expect(plant_data2[:data].count).to eq(5)
  end

  it 'returns results in alphabetical order by common name' do
    plant1 = create(:plant, common_name: 'Basil')
    plant2 = create(:plant, common_name: 'Zebra')
    plant3 = create(:plant, common_name: 'Apple')

    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }
    get('/api/v1/plants/', headers:)

    plant_data = JSON.parse(response.body, symbolize_names: true)
    expect(plant_data[:data].first[:attributes][:common_name]).to eq(plant3.common_name)
    expect(plant_data[:data].second[:attributes][:common_name]).to eq(plant1.common_name)
    expect(plant_data[:data].third[:attributes][:common_name]).to eq(plant2.common_name)
  end

  it 'returns all the details for a plant not in the database, plant passed as query param', :vcr do
    plant_name = 'Jalapeno'
    expected_keys = %i[scientific_name common_name sun_exposure planting_method planting_time watering
                       fertilization pruning harvest_method harvest_timeline pests homeopathic_remedies spacing other_notes].sort

    expect(Plant.count).to eq(0)
    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }
    get("/api/v1/plants?name=#{plant_name}", headers:)

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
end
