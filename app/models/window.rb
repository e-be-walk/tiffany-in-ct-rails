class Window < ApplicationRecord
  belongs_to :site
  has_many :comments, through: :users
end
