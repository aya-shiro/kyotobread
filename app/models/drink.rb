class Drink < ApplicationRecord
  belongs_to :bread

  # has_one_attached :drink_image
  # drinkはadminでアイコン化にする

end
