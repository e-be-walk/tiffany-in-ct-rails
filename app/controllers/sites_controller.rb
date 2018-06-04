class SitesController < ApplicationController
  has_many :windows
  has_many :comments, through: :users
end
