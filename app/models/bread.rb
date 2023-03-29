class Bread < ApplicationRecord

  belongs_to :user
  belongs_to :shop

  has_one_attached :bread_image

end
