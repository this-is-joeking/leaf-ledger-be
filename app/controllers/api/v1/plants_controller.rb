module Api
  module V1
    class PlantsController < ApplicationController
      def show
        if params[:name]
          plant = Plant.find_by('common_name ILIKE ?', params[:name])

          plant ||= PlantFacade.new(params[:name])
        else
          plant = Plant.find(params[:id])
        end
        render_plant(plant)
      end

      def index
        if params[:name]
          show
        else
          plants = paginate Plant.order(:common_name)
          render json: PlantSerializer.new(plants), status: :ok
        end
      end

      private

      def render_plant(plant)
        render json: PlantSerializer.new(plant), status: :ok
      end
    end
  end
end
