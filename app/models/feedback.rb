class Feedback < ApplicationRecord

  belongs_to :user

  validates :opinion, presence: true

end
