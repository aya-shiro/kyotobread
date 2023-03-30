class Bread < ApplicationRecord

  belongs_to :user
  belongs_to :shop
  # ☆drinkと中間テーブル作る


  has_one_attached :bread_image

  def get_bread_image(width, height)
    unless dread_image.attached?
      file_path = Rails.root.join('app/assets/images/bread_image.jpg')
      bread_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    bread_image.variant(resize_to_limit: [width, height]).processed
  end


end
