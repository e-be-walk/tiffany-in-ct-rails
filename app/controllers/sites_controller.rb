class SitesController < ApplicationController
  def show
    @site = Site.find_by(id: params[:id])
    @user = current_user
  end

  def new
    @site = Site.new
  end

  def create
    @user = current_user
    @site = Site.create(site_params)
    @site.save
    current_user.sites << @site
    redirect_to new_user_site_path(@site)
  end

  def edit
  end

  def update
    @site = Site.find(site_params[:id])
    @site.update(site_params)
    @site.save
<<<<<<< HEAD
    redirect_to site_path(@site)
=======
    current_user.sites << @site
    redirect_to user_site_path(@site)
>>>>>>> 60ec49cea0ad77e9f4876d77c344c38d4b9fe977
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to user_path(current_user)
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
