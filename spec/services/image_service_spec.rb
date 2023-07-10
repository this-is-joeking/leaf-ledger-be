# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImageService, :vcr do
  describe '.new' do
    it 'responds with temporary url for generated plant image' do
      response = ImageService.new('pumpkin')

      expect(response).to be_a Hash
      expect(response.keys.sort).to eq(%i[created data].sort)
      expect(response[:created]).to be_a Integer
      expect(response[:data]).to be_an Array
      expect(response[:data].count).to eq(1)
      expect(response[:data].first[:url]).to be_a String
    end
  end
end
