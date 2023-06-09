class Bread < ApplicationRecord

  scope :active_users_breads, -> { includes(:user).where(user: { is_delete: false }) }


  belongs_to :user
  belongs_to :shop, optional: true    # shopのnilを許す
  has_many :topic

  belongs_to :drink
  accepts_nested_attributes_for :drink

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user    #いいね順

  def favorite_by?(user)
    user.present? && favorites.exists?(user_id: user.id)
  end


  validates :bread_image, presence: true
  validates :bread_name, presence: true, length:{maximum:20}
  validates :introduce, presence: true, length:{maximum:150}
  validates :taste, inclusion: {in: [true, false], message: 'はどちらかを選択してください' }

  has_one_attached :bread_image

  def get_bread_image(width, height)
    unless bread_image.attached?
      file_path = Rails.root.join('app/assets/images/no-bread-image.jpg')
      bread_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    bread_image.variant(resize_to_fill: [width, height]).processed   #写真をresize_to_fillでスクエアに
  end


end
