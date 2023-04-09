class Shop < ApplicationRecord
  has_many :bread
  has_many :shop_topics
  # has_one :online, class_name: 'Shop::Online'
  has_one :online

  accepts_nested_attributes_for :online


  # user/breads/newで使用
  def address_display
    '〒' + postcode + ' ' + address + ' ' + shop_name
  end
end
