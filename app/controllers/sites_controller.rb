class SitesController < ApplicationController
  before_action :current_user

  def show
    @user = current_user
    @site = Site.find_by(params[:user_id])
  end

  def new
    @site = Site.new
    @user = current_user
  end

  def create
    @user = current_user
    @site = Site.create(site_params)
    @site.save
    redirect_to site_path(current_user)
  end

  private

  def site_params
    params.require(:site).permit(
      :user_id,
      :name,
      :street_address,
      :city,
      :zip_code,
      :contact_info,
      :accessibility,
      :site_info,
      :image
    )
  end
end
