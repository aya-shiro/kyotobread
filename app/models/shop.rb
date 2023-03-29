class Shop < ApplicationRecord
  has_many :bread
  has_many :drink
  has_one :online
end
