class WindowsController < ApplicationController
  before_action :current_user

  def show
    @user = current_user
    @window = Window.find_by(params[:user_id])
  end

  def new
    @windows = current_user.windows
    @window = Window.new
    @user = current_user
  end

  def create
    @window = current_user.windows.create(window_params)
    #raise params.inspect
    @window.save
    redirect_to window_path(current_user, @window)
  end


  private

  def window_params
    params.require(:window).permit(
      :user_id,
      :site_id,
      :name,
      :year_created,
      :dedication,
      :window_info,
      :image
    )
  end
end
