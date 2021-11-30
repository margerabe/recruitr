# frozen_string_literal: true

class InterviewsController < ApplicationController
  before_action :set_interview, only: %i[show edit update destroy]

  def index
    render json: Interview.includes(:candidate)
  end

  def show
    render json: @interview
  end

  def create
    @interview = Interview.new(interview_params)

    if @interview.save
      InterviewMailer.with(interview: @interview).interview_email.deliver_later
      
      render json: @interview, status: :created
    else
      render_error(@interview)
    end
  end

  def update
    if @interview.update(interview_params)
      InterviewMailer.with(interview: @interview).interview_email.deliver_later

      render json: @interview
    else
      render_error(@interview)
    end
  end

  def destroy
    @interview.destroy
    render json: Interview.includes(:candidate), status: :no_content
  end

  private

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def interview_params
    params.require(:interview).permit(:start_time, :end_time, :candidate_id, :recruiter_id)
  end
end
