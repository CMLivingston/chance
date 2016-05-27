class Match < ActiveRecord::Base
  belongs_to :sender, class_name:"User"
	belongs_to :receiver, class_name:"User"
  validates :user_id, presence: true
  validates :receiver_id, presence: true
  validates :content, presence: true, length: {maximum: 75}
  validates :meet_loc, presence: true, length: {maximum: 15}
  validates :meet_time, presence: true
  default_scope -> {order(created_at: :desc)}
end
