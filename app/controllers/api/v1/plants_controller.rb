module Api
  module V1
    class PlantsController < ApplicationController
      def show
        plant = Plant.find_by(common_name: params[:name])

        if plant
          render_plant(plant)
        else
          plant = PlantFacade.new(params[:name])
          render_plant(plant)
        end
      end

      private

      def render_plant(plant)
        render json: PlantSerializer.new(plant), status: :ok
      end
    end
  end
end
