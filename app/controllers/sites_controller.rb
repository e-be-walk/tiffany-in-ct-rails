class SitesController < ApplicationController
  def show
    @site = Site.find_by(id: params[:id])
    @user = current_user
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.create(site_params)
    @site.save
    redirect_to site_path(@site)
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
