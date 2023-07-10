# frozen_string_literal: true

include Rails.application.routes.url_helpers

class Plant < ApplicationRecord
  has_many :user_plants
  has_many :users, through: :user_plants
  has_one_attached :ai_generated_image
  before_save :grab_image

  validates_presence_of :scientific_name, :common_name

  def grab_image
    return unless plant_img

    downloaded_image = Down.download(plant_img)
    ai_generated_image.attach(io: downloaded_image, filename: "#{common_name}.jpg")
  end

  def plant_img_url
    default_url_options[:host] = ENV['BASE_URL']
    url_for(ai_generated_image)
  end
end
