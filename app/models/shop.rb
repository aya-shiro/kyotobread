class Shop < ApplicationRecord
  has_many :bread

  has_one :online, class_name: 'Shop::Online'
  # onlineはshopに1以上が必須ではないのでoptional: trueをつけてエラー回避する
end
