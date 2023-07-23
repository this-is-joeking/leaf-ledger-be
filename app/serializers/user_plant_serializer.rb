# frozen_string_literal: true

class UserPlantSerializer
  include JSONAPI::Serializer
  attributes :user_notes, :date_planted, :updated_at, :created_at

  belongs_to :plant, serializer: PlantSerializer
end
