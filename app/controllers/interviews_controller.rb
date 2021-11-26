class InterviewsController < ApplicationController
  before_action :set_interview, only: [:show, :edit, :update, :destroy]

  def index
    render json: Interview.all
  end

  def show
    render json: @interview
  end

  def create
    interview = Interview.new(interview_params)
    random_offset = rand(Recruiter.count)
    random_recruiter = Recruiter.offset(random_offset).first
    interview.recruiter = random_recruiter

    if interview.save
      render json: interview, status: :created
    else
      render_error(interview)
    end
  end

  def update
    @interview.update(interview_params)

    if @interview.save
      render json: @interview
    else
      render_error(@interview)
    end
  end

  def destroy
    @interview.destroy
    render json: Interview.all
  end

  private

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def interview_params
    params.require(:interview).permit(:start_time, :end_time, :candidate_id)
  end
end
