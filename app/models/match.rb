class Match < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 75}
  validates :meet_time, presence: true
  default_scope -> {order(created_at: :desc)}
end
