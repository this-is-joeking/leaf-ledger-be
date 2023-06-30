module Api
  module V1
    class PlantsController < ApplicationController
      def show
        plant = Plant.find_by('common_name ILIKE ?', params[:name])

        plant ||= PlantFacade.new(params[:name])
        render_plant(plant)
      end

      def index
        plants = Plant.all
        paginate json: PlantSerializer.new(plants), status: :ok
      end

      private

      def render_plant(plant)
        render json: PlantSerializer.new(plant), status: :ok
      end
    end
  end
end
