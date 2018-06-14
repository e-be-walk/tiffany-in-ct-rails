class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end

  def create
    if @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        #@user = current_user
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to new_user_url
      end
    else
      @user = User.new
      redirect_to new_user_url
    end
  end
    #@user = User.find_or_create_by(uid: auth['uid']) do |u|
    #  u.name = auth['info']['name']
    #end
    #session[:user_id]
    #redirect_to user_path(@user)
    #raise params.inspect
    #@user = User.find_by(name: params[:name])
    #raise params.inspect
    #if @user && @user.authenticate(params[:password])
      #session[:user_id] = @user.id
      #redirect_to user_path(@user)
    #else
      #redirect_to signin_path
    #end
  #end
  def facebook
    if auth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = params[:code][0..71]
        #raise params.inspect
      end
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @user = User.new
      redirect_to new_user_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
