class Bread < ApplicationRecord

  belongs_to :user
  belongs_to :shop
  has_many :topic

  belongs_to :drink

  has_many :comments, dependent: :destroy



  has_one_attached :bread_image

  def get_bread_image(width, height)
    unless bread_image.attached?
      file_path = Rails.root.join('app/assets/images/bread_image.jpg')
      bread_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    bread_image.variant(resize_to_limit: [width, height]).processed
  end


end
