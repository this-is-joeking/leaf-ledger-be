# frozen_string_literal: true

module Api
  module V1
    class UserPlantsController < ApplicationController
      def create
        up = UserPlant.create!(user_plant_params)
        render json: UserPlantSerializer.new(up), status: :created
      end

      def update
        up = UserPlant.find(params[:id])
        up.update(user_plant_params)

        render json: UserPlantSerializer.new(up), status: :ok
      end

      def user_plant_params
        params.permit(:plant_id, :user_id, :user_notes, :date_planted)
      end
    end
  end
end
