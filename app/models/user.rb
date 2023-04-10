class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64  #ランダムパスワード生成
      # user.skip_confirmation!  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
      user.name = "ゲスト"
    end
  end

  has_many :bread, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :bread_image  #ユーザー詳細でパン写真表示のため記述

  def get_bread_image(width, height)
    unless bread_image.attached?
      file_path = Rails.root.join('app/assets/images/no-bread-image.jpg')
      bread_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    bread_image.variant(resize_to_fill: [width, height]).processed  #写真をresize_to_fillでスクエアに
  end


  has_one_attached :user_image

  def get_user_image(width, height)
    unless user_image.attached?
      file_path = Rails.root.join('app/assets/images/no-user-image.jpg')
      user_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    user_image.variant(resize_to_fill: [width, height]).processed  #写真をresize_to_fillでスクエアに
  end
end
