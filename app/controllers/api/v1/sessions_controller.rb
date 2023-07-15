module Api
  module V1
    class SessionsController < ApplicationController
      def create
        conn = Faraday.new(
          url: 'https://www.googleapis.com/oauth2/v3/tokeninfo', 
          headers: {
            Authorization: "Bearer #{params[:headers][:GoogleToken][:access_token]}",
            Accept: 'application/json'
          })
        response = conn.get
        parsed = JSON.parse(response.body, symbolize_names: true)
        
        require 'pry'; binding.pry
        
      end

      private

      def new_session_params
        # params.require(:session).permit(headers: [:Authorization])
      end
    end
  end
end

# This way works




# then send conn.get and data is returned for user
# still need to research ways to verify other parts of token instead
# of assuming gogole is doing ll verifying
