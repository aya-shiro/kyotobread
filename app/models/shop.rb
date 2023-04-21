class Shop < ApplicationRecord
  # has_many :bread
  has_many :breads
  has_many :shop_topics

  # accepts_nested_attributes_for :online, update_only: true
  # update_only: trueは、onlineモデルのカラムを”入れ替え”でなく”上書き”するために必要なオプション


  # user/breads/_post-formで使用
  def address_display
    ' ' + shop_name +  '〒' + postcode + ' ' + address
  end
end
