# frozen_string_literal: true

class PositionSkillsController < ApplicationController
  def index
    render json: PositionSkill.includes([:position, :skill])
  end

  def create
    position_skill = PositionSkill.new(position_skill_params)

    if position_skill.save
      render json: position_skill, status: :created
    else
      render_error(position_skill)
    end
  end

  private

  def position_skill_params
    params.require(:position_skill).permit(:position_id, :skill_id)
  end
end
