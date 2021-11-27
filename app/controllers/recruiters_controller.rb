# frozen_string_literal: true

class RecruitersController < ApplicationController
  before_action :set_recruiter, only: %i[show update destroy]

  def index
    render json: Recruiter.all
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
    @recruiter.update(recruiter_params)

    if @recruiter.save
      render json: @recruiter
    else
      render_error(@recruiter)
    end
  end

  def destroy
    @recruiter.destroy
    render json: Recruiter.all
  end

  private

  def set_recruiter
    @recruiter = Recruiter.find(params[:id])
  end

  def recruiter_params
    params.require(:recruiter).permit(:title)
  end
end
