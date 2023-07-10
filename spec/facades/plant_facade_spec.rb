# frozen_string_literal: true

require 'rails_helper'
include Rails.application.routes.url_helpers

RSpec.describe PlantFacade, :vcr do
  describe '.new' do
    it 'returns a plant object based on plant name given' do
      plant = PlantFacade.new('corn')

      expect(plant).to be_a Plant
      expect(plant.ai_generated_image.attached?).to be true
    end
  end
end
