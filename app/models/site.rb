class Site < ApplicationRecord
  has_many :windows
  has_many :comments, through: :users
end
