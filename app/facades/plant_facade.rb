# frozen_string_literal: true

class PlantFacade
  def self.new(plant_name)
    plant_data = PlantService.new(plant_name)
    Plant.create!(plant_data)
  end
end
