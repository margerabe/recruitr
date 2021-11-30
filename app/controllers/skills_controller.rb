# frozen_string_literal: true

class SkillsController < ApplicationController
  before_action :set_skill, only: %i[show update destroy]

  def index
    render json: Skill.includes(%i[position_skills positions])
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
    if @skill.update(skill_params)
      render json: @skill
    else
      render_error(@skill)
    end
  end

  def destroy
    @skill.destroy
    render json: skills_url, status: :no_content
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name)
  end
end
