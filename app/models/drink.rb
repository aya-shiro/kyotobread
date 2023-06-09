class Drink < ApplicationRecord
  has_many :breads
  has_one_attached :drink_image

  scope :default, -> { where(default_select: true) }    # あらかじめ設定したデフォルトドリンク
  scope :not_default, -> { where(default_select: false) }    # admin/drinksで登録できるドリンク

  validates :drink_name, presence: true


  def get_drink_image(width, height)
    unless drink_image.attached?
      file_path = Rails.root.join('app/assets/images/bread_image.jpg')
      drink_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    drink_image.variant(resize_to_limit: [width, height]).processed
  end


end
