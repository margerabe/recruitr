class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :check_user, only: %i[update destroy]

  def show
    render json: User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render_error(@user)
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :created
    else
      render_error(@user)
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_user
    head :forbidden unless @user.id == current_user&.id
  end
end
