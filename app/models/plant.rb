# frozen_string_literal: true

class Plant < ApplicationRecord
  has_many :user_plants
  has_many :users, through: :user_plants

  validates_presence_of :scientific_name, :common_name
end
