# frozen_string_literal: true

class RecruitersController < ApplicationController
  before_action :set_recruiter, only: %i[show update destroy]

  def index
    render json: Recruiter.includes([:interviews])
  end

  def show
    render json: @recruiter
  end

  def create
    recruiter = Recruiter.new(recruiter_params)

    if recruiter.save
      render json: recruiter, status: :created
    else
      render_error(recruiter)
    end
  end

  def update
    if @recruiter.update(recruiter_params)
      render json: @recruiter
    else
      render_error(@recruiter)
    end
  end

  def destroy
    @recruiter.destroy
    render json: recruiters_url, status: :no_content
  end

  private

  def set_recruiter
    @recruiter = Recruiter.find(params[:id])
  end

  def recruiter_params
    params.require(:recruiter).permit(:first_name, :last_name, :email)
  end
end
