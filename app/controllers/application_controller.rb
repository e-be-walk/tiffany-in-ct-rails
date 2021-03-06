class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user, except: [:new, :create, :home, :about, :index]
  helper_method :logged_in?
  helper_method :current_user

  def logged_in?
    !!current_user
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
