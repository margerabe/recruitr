class ApplicationController < ActionController::API
  def render_error(object)
    render json: { errors: object.errors.full_messages }, status: :unprocessable_entity
  end
end
