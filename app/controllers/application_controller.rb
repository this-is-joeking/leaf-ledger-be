# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_error

  private

  def render_error(error)
    render json: ErrorSerializer.not_found(error.message), status: :not_found
  end
end
