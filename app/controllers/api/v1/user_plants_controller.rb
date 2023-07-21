# frozen_string_literal: true

module Api
  module V1
    class UserPlantsController < ApplicationController
      def create
        up = UserPlant.create!(user_plant_params)
        render json: UserPlantSerializer.new(up), status: :created
      end

      def update
        user = User.find(params[:user_id])
        up = UserPlant.find(params[:id])
        if up.user == user
          up.update(user_plant_params)

          render json: UserPlantSerializer.new(up), status: :ok
        else
          render json: ErrorSerializer.forbidden("UserPlant #{up.id} does not belong to user #{user.id}"),
                 status: :forbidden
        end
      end

      def destroy
        user = User.find(params[:user_id])
        up = UserPlant.find(params[:id])
        if up.user == user
          up.destroy

          render status: :no_content
        else
          render json: ErrorSerializer.forbidden("UserPlant #{up.id} does not belong to user #{user.id}"),
                 status: :forbidden
        end
      end

      private

      def user_plant_params
        params.permit(:plant_id, :user_id, :user_notes, :date_planted)
      end
    end
  end
end
