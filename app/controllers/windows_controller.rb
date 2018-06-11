class WindowsController < ApplicationController
  before_action :current_user

  def show
    @user = current_user
    @window = Window.find_by(id: params[:id])
  end

  def new
    @user = current_user
    @window = Window.new
  end

  def create
    @user = current_user
    @window = Window.create(window_params)
    @window.save
    redirect_to user_window_path
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
