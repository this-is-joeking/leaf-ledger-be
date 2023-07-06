# frozen_string_literal: true

module Api
  module V1
    class PlantsController < ApplicationController
      rescue_from PlantError, with: :invalid_plant_name
      before_action :validate_params, only: :create

      def show
        plant = Plant.find(params[:id])
        render_plant(plant)
      end

      def create
        plant = Plant.find_by('common_name ILIKE ?', params[:name])

        plant ||= PlantFacade.new(params[:name])
        render_plant(plant)
      end

      def index
        if params[:q]
          # require 'pry'; binding.pry
          plants = Plant.where("common_name ILIKE ?", "%#{params[:q]}%").order(:common_name)
        else
          plants = paginate Plant.order(:common_name)
        end
        render json: PlantSerializer.new(plants), status: :ok
      end

      private

      def render_plant(plant)
        render json: PlantSerializer.new(plant), status: :ok
      end

      def invalid_plant_name(error)
        render json: ErrorSerializer.bad_params(error), status: :unprocessable_entity
      end

      def validate_params
        return if params[:name].present?

        if params[:name] == ''
          render json: ErrorSerializer.missing_value('name'), status: :unprocessable_entity
        else
          render json: ErrorSerializer.missing_param('name'), status: :unprocessable_entity
        end
      end
    end
  end
end
