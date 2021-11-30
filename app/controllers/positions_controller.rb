# frozen_string_literal: true

class PositionsController < ApplicationController
  before_action :set_position, only: %i[show update destroy]

  def index
    render json: Position.includes([:candidates])
  end

  def show
    render json: @position
  end

  def create
    position = Position.new(position_params)

    if position.save
      render json: position, status: :created
    else
      render_error(position)
    end
  end

  def update
    if @position.update(position_params)
      render json: @position
    else
      render_error(@position)
    end
  end

  def destroy
    @position.destroy
    render json: positions_url, status: :no_content
  end

  private

  def set_position
    @position = Position.find(params[:id])
  end

  def position_params
    params.require(:position).permit(:title, skill_ids: [])
  end
end
