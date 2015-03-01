class User < ActiveRecord::Base
  has_secure_password

  has_many :joins
  has_many :itineraries, through: :joins
  has_many :destinations, through: :joins

  # has_many :comments, as: :commentable
  
  validates :first_name, :last_name, :username, presence: true
  validates :username, uniqueness: true

end
