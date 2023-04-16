class Bread < ApplicationRecord

  belongs_to :user
  belongs_to :shop
  has_many :topic

  belongs_to :drink
  accepts_nested_attributes_for :drink

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy  #いいね機能
  has_many :favorited_users, through: :favorites, source: :user    #いいね順

  def favorite_by?(user)
    # favorites.exists?(user_id: user.id)
    user.present? && favorites.exists?(user_id: user.id)
  end

  # enum taste_selects: { plain: 0, sweet: 1, salt: 2 

  validates :bread_image, presence: true
  validates :bread_name, presence: true, length:{maximum:20}
  validates :introduce, presence: true, length:{maximum:80}
  validates :taste, inclusion: {in: [true, false]}


  has_one_attached :bread_image

  def get_bread_image(width, height)
    unless bread_image.attached?
      file_path = Rails.root.join('app/assets/images/no-bread-image.jpg')
      bread_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    bread_image.variant(resize_to_fill: [width, height]).processed   #写真をresize_to_fillでスクエアに
  end


end
