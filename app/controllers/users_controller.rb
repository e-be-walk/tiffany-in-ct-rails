class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = User.create(user_params)
      session[:user_id] = @user.id
      raise params.inspect
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :site_admin)
  end
end
