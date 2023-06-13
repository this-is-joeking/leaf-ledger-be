class User < ApplicationRecord
  has_many :user_plants
  has_many :plants, through: :user_plants
end
