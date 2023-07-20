module Api
  module V1
    class UserPlantsController < ApplicationController
      def create
        up = UserPlant.create!(user_plant_params)
        render json: UserPlantSerializer.new(up), status: :created
      end

      def user_plant_params
        params.permit(:plant_id, :user_id, :user_notes)
      end
    end
  end
end