class AddPlantImgToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :plant_img, :string
  end
end
