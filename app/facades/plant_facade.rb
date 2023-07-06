# frozen_string_literal: true

class PlantFacade
  def self.new(plant_name)
    plant_data = PlantService.new(plant_name)

    raise PlantError, "Could not find any plant matching the name: #{plant_name}" if plant_data == 422

    Plant.create!(plant_data)
  end
end
