module Api
  module V1
    class SessionsController < ApplicationController
      def create
        require 'pry'; binding.pry
      end

      private

      def new_session_params
        params.require(:session).permit(headers: [:Authorization])
      end
    end
  end
end