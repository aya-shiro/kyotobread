class Shop < ApplicationRecord
  has_many :bread
  has_many :shop_topics
  has_one :online, class_name: 'Shop::Online'

  # user/breads/newで使用
  def address_display
    '〒' + postcode + ' ' + address + ' ' + shop_name
  end
end
