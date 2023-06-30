require 'rails_helper'

RSpec.describe PlantFacade, :vcr do
  describe '.new' do
    it 'returns a plant object based on plant name given' do
      plant = PlantFacade.new('corn')

      expect(plant).to be_a Plant
    end
  end
end
