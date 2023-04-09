class Topic < ApplicationRecord
  belongs_to :bread, optional: true    #breadモデルはお互い0以上でもOK
  has_many :shop_topics


  has_one_attached :bread_image

  def get_bread_image(width, height)
    unless bread_image.attached?
      file_path = Rails.root.join('app/assets/images/no-bread-image.jpg')
      bread_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    bread_image.variant(resize_to_fill: [width, height]).processed   #写真をresize_to_fillでスクエアに
  end

end
