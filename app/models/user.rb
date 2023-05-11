class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :active_users, -> { where(is_delete: false) }

  def self.guest
    find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64  #ランダムパスワード生成
      user.name = "ゲスト"
    end
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end


  validates :name, presence: true, length:{maximum:10}
  validates :user_info, presence: true, length:{maximum:100}

  has_many :breads, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :feedbacks


  has_one_attached :bread_image

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
    user_image.variant(resize_to_fill: [width, height]).processed
  end
end
