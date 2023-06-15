require 'rails_helper'

RSpec.describe PlantService, :vcr do
  describe '.new' do
    it 'gets data for a new plant' do
      response = PlantService.new('pumpkin')

      expect(response).to be_a Hash
      expect(response.keys.sort).to eq(%i[
        scientific_name
        common_name
        sun_exposure
        planting_time
        planting_method
        watering
        fertilization
        pruning
        harvest_timeline
        harvest_method
        pests
        homeopathic_remedies
        spacing
        other_notes
      ].sort)
      response.each do |_k, v|
        expect(v).to be_a String
      end
    end
  end
end
