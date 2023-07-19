# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'create a user' do
  it 'takes info from google login to create a new user' do
    expect(User.count).to eq(0)
    params = '{"data":{"id":"117833646270849236918","email":"j.king92@gmail.com","verified_email":true,"name":"Joe King","given_name":"Joe","family_name":"King","picture":"https://lh3.googleusercontent.com/a/AAcHTte67VPNyMFcu7IzIp485r8W69YTEUlxJzhNx8sc-EQ2Tjs=s96-c","locale":"en"}}'
    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }
    post('/api/v1/users', headers:, params:)

    user_data = JSON.parse(response.body, symbolize_names: true)
    expect(User.count).to eq(1)
    user = User.last
    expect(response).to be_successful
    expect(user_data.keys).to eq([:data])
    expect(user_data[:data].keys.sort).to eq(%i[id type attributes].sort)
    expect(user_data[:data][:id].to_i).to eq(user.id)
    expect(user_data[:data][:type]).to eq('user')
    expect(user_data[:data][:attributes].keys.sort).to eq(%i[gid email name picture].sort)
  end

  it 'returns an existing user if users Google ID is already in database' do
    User.create!({ 'gid' => '117833646270849236918', 'email' => 'j.king92@gmail.com', 'name' => 'Joe King',
                   'picture' => 'https://lh3.googleusercontent.com/a/AAcHTte67VPNyMFcu7IzIp485r8W69YTEUlxJzhNx8sc-EQ2Tjs=s96-c' })

    expect(User.count).to eq(1)

    params = '{"data":{"id":"117833646270849236918","email":"j.king92@gmail.com","verified_email":true,"name":"Joe King","given_name":"Joe","family_name":"King","picture":"https://lh3.googleusercontent.com/a/AAcHTte67VPNyMFcu7IzIp485r8W69YTEUlxJzhNx8sc-EQ2Tjs=s96-c","locale":"en"}}'
    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }
    post('/api/v1/users', headers:, params:)

    user_data = JSON.parse(response.body, symbolize_names: true)
    expect(User.count).to eq(1)
    user = User.last
    expect(response).to be_successful
    expect(user_data.keys).to eq([:data])
    expect(user_data[:data].keys.sort).to eq(%i[id type attributes].sort)
    expect(user_data[:data][:id].to_i).to eq(user.id)
    expect(user_data[:data][:type]).to eq('user')
    expect(user_data[:data][:attributes].keys.sort).to eq(%i[gid email name picture].sort)
  end
end
