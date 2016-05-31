class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :matches, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
  before_save :init

  # here is the current email validation
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@dartmouth.edu\z/, message: ": Sorry! You must have a Dartmouth email account to sign up." }



  def init
    self.admin ||= false
  end

  # helper methods

  # the method to add person to users watchlist and check for a match y the followed_by method
  def add_to_list(other)
    if !self.following?(other)
      self.follow(other)
      if self.has_match?(other)
        # MATCH!!!! OPEN A CARD OPTION!!!!
      end
    else
      raise "Already following #{other.first_name} #{other.last_name}"
    end
  end

  def follow(other)
  	active_relationships.create(followed_id: other.id)
  end

  def unfollow(other)
  	active_relationships.find_by(followed_id: other.id).destroy
  end

  def following?(other)
  	following.include?(other)
  end

  def followed_by?(other)
    followers.include?(other)
  end

  def has_match?(other)
    (following?(other) && followed_by?(other))
  end
end
