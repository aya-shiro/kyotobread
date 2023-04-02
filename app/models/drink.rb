class Drink < ApplicationRecord
  has_many :breads

  # has_one_attached :drink_image
  # drinkはadminでアイコン化にする

end
