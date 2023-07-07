# frozen_string_literal: true

class PlantSerializer
  include JSONAPI::Serializer
  include Rails.application.routes.url_helpers
  attributes :scientific_name, :common_name, :sun_exposure, :planting_time, :planting_method, :watering,
             :fertilization, :pruning, :harvest_timeline, :harvest_method, :pests, :homeopathic_remedies, :spacing, :other_notes, :plant_img_url
end
