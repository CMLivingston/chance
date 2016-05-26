class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :matches
  

  # here is the current email validation
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@dartmouth.edu\z/, message: ": Sorry! You must have a Dartmouth email account to sign up." }
end
