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

    plant_data = JSON.parse(response.body, symbolize_names: true)

    expect(Plant.count).to eq(30)
    expect(response).to have_http_status(200)
    expect(plant_data[:data].count).to eq(25)
    expect(response.header['Per-Page']).to eq('25')
    expect(response.header).to have_key('Link')
    expect(response.header['Total']).to eq('30')
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
end
