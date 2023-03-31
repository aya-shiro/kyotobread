class Shop < ApplicationRecord
  has_many :bread
  has_one :online, optional: true
  # onlineはshopに1以上が必須ではないのでoptional: trueをつけてエラー回避する
end
