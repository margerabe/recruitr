# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Authenticable
  
  def render_error(object)
    render json: { errors: object.errors.full_messages }, status: :unprocessable_entity
  end
end
