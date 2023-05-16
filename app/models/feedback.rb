class Feedback < ApplicationRecord

  belongs_to :user

  validates :opinion, presence: true
  validates :is_solved, presence: true

end
