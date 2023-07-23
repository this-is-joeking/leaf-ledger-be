# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = User.find_by(gid: user_params[:gid])

        user ||= User.create!(user_params)

        render json: UserSerializer.new(user), status: :created
      end

      def destroy
        user = User.find(params[:id])
        user.destroy

        render status: :no_content
      end

      private

      def user_params
        params[:data][:gid] = params[:data][:id]
        params.require(:data).permit(:gid, :email, :name, :picture)
      end
    end
  end
end
