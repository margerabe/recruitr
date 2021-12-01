# frozen_string_literal: true

class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[show update destroy]

  def index
    render json: Candidate.includes(%i[position interview])
  end

  def show
    render json: @candidate
  end

  def create
    candidate = Candidate.new(candidate_params)

    if candidate.save
      render json: candidate, status: :created
    else
      render_error(candidate)
    end
  end

  def update
    if @candidate.update(candidate_params)
      render json: @candidate
    else
      render_error(@candidate)
    end
  end

  def destroy
    @candidate.destroy
    render json: candidates_url, status: :no_content
  end

  private

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:first_name, :last_name, :email, :position_id)
  end
end
