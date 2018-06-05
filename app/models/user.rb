class User < ApplicationRecord
  has_secure_password
  has_one :site
  has_many :windows, through: :sites
  has_many :comments
end
