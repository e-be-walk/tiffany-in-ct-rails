class WindowsController < ApplicationController

  def show
    @window = Window.find_by(params[:id])
  end

  def new
    @windows = current_user.windows
    @window = Window.new
    @user = current_user
  end

  def create
    @site = Site.find_by(params[:site_id])
    @window = Window.create(window_params)
    @window.save
    redirect_to site_window_path
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
