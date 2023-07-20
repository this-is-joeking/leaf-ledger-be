# frozen_string_literal: true

class UserPlantSerializer
  include JSONAPI::Serializer
  attributes :user_id, :plant_id, :user_notes, :date_planted, :updated_at, :created_at
end
