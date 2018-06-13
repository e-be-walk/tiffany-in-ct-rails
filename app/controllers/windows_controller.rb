class WindowsController < ApplicationController

  def show
    @site = Site.find_by(id: params[:id])
    @user = current_user
    @window = Window.find(params[:id])
  end

  def new
    @site = Site.find(params[:site_id])
    @window = @site.windows.build
  end

  def create
    @user = current_user
    @site = Site.find(params[:site_id])
    @window = Window.create(window_params)
    @window.save
    @site.windows << @window
    redirect_to site_window_path(@site, @window)
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
