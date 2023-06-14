class Plant < ApplicationRecord
  attr_accessor :id, 
                :scientific_name, 
                :common_name, 
                :sun_exposure, 
                :planting_time, 
                :planting_method, 
                :watering, 
                :fertilization, 
                :pruning, 
                :harvest_timeline, 
                :harvest_method, 
                :pests, 
                :homeopathic_remedies, 
                :spacing, 
                :other_notes

  
  has_many :user_plants
  has_many :users, through: :user_plants

end
