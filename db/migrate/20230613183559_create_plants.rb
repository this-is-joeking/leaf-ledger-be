class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :scientific_name
      t.string :common_name
      t.string :sun_exposure
      t.string :planting_time
      t.string :planting_method
      t.string :watering
      t.string :fertilization
      t.string :pruning
      t.string :harvest_timeline
      t.string :harvest_method
      t.string :pests
      t.string :homeopathic_remedies
      t.string :spacing
      t.string :other_notes
      t.string :user_notes
      t.string :date_planted

      t.timestamps
    end
  end
end
