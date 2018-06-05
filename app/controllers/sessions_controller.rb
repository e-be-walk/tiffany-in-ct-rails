class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end

  def create
    #raise params.inspect
    @user = User.find_by(name: params[:name])
    #raise params.inspect
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
