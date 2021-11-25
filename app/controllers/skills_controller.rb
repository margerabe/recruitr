class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  def index
    render json: Skill.all
  end

  def show
    render json: @skill
  end

  def create
    skill = Skill.new(skill_params)

    if skill.save
      render json: skill, status: :created
    else
      render_error(skill)
    end
  end

  def update
    @skill.update(skill_params)

    if @skill.save
      render json: @skill
    else
      render_error(@skill)
    end
  end

  def destroy
    @skill.destroy
    render json: Skill.all
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:title)
  end
end
