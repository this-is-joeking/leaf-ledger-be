# frozen_string_literal: true

class Plant < ApplicationRecord
  has_many :user_plants
  has_many :users, through: :user_plants
  has_one_attached :ai_generated_image
  before_save :grab_image

  validates_presence_of :scientific_name, :common_name

  def grab_image
    downloaded_image = Down.download(self.plant_img)
    ai_generated_image.attach(io: downloaded_image, filename: "#{self.common_name}.jpg")
  end
end
