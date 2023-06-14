class CreateUserPlants < ActiveRecord::Migration[7.0]
  def change
    create_table :user_plants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true
      t.string :user_notes
      t.date :date_planted
      
      t.timestamps
    end
  end
end
