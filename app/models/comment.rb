class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :bread

  validates :comment, presence: true, length:{maximum:80}

end
