class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :matches, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :active_relationships, source: :follower
  

  # here is the current email validation
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@dartmouth.edu\z/, message: ": Sorry! You must have a Dartmouth email account to sign up." }



  # helper methods

  def follow(other)
  	active_relationships.create(followed_id: other.id)
  end

  def unfollow(other)
  	active_relationships.find_by(followed_id: other.id).destroy
  end

  def following?(other)
  	following.include?(other)
  end

end
