module Api
  module V1
    class SessionsController < ApplicationController
      rescue_from SessionError, with: :handle_session_error
      def create
        conn = Faraday.new(
          url: 'https://www.googleapis.com/oauth2/v3/tokeninfo',
          headers: {
            Authorization: "Bearer #{params[:headers][:GoogleToken][:access_token]}",
            Accept: 'application/json'
          }
        )
        response = conn.get
        parsed = JSON.parse(response.body, symbolize_names: true)
        validate_token_info(parsed)

        render json: parsed, status: :created
        require 'pry'
        binding.pry
      end

      private

      def new_session_params
        # params.require(:session).permit(headers: [:Authorization])
      end

      def validate_token_info(google_response)
        if google_response[:aud] != ENV['GOOGLE_CLIENT_ID']
          raise SessionError, "Invalid origin: #{google_response[:aud]}"
        elsif Time.now >= Time.at(google_response[:exp].to_i)
          raise SessionError, "Token Expired"
        elsif google_response[:error_description]
          raise SessionError, google_response[:error_description]
        end
      end

      def handle_session_error
        render json: ErrorSerializer.invalid_token(error), status: :unauthorized
      end
    end
  end
end
