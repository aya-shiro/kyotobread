class Drink < ApplicationRecord

  belongs_to :user
  belongs_to :shop

  has_one_attached :drink_image

end
