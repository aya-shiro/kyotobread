class Shop < ApplicationRecord
  has_many :bread
  has_many :shop_topics
  has_one :online, class_name: 'Shop::Online'
end
