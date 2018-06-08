class WindowsController < ApplicationController

  def show
    @window = Window.find_by(id: params[:id])
    @site = Site.find_by(id: params[:id])
    @user = current_user
  end

  def new
    @window = Window.new
  end

  def create
    @window = Window.create(window_params)
    @window.save
    redirect_to window_path(@window)
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
