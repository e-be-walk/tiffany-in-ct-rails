class SitesController < ApplicationController

  def show
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    redirect_to site_path(@user, @site)
  end

  private

  def site_params
    params.require(:site).permit(
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
