class Topic < ApplicationRecord
  belongs_to :bread, optional: true    #breadモデルはお互い0以上でもOK
  has_many :shop_topics

end
