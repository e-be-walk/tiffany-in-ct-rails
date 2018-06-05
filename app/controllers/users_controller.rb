class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]

  def show
    if logged_in?
      @user = User.find_by(id: params[:id])
    else
      redirect_to '/'
    end
  end

  def new
    @user = User.new
  end

  def create
    if @user = User.new(user_params)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :site_admin
    )
  end
end
