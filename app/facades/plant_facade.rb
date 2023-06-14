# the content is found here [:choices][0][:message][:content]//
class PlantFacade
  def self.new(plant_name)
    plant_data = PlantService.new(plant_name)
    Plant.create!(plant_data)
  end
end
