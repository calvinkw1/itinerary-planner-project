class User < ActiveRecord::Base
  has_secure_password

  has_many :joins
  has_many :itineraries, through: :joins
  has_many :destinations, through: :joins

  has_many :comments, as: :commentable
  
  validates :first_name, :last_name, :username, presence: true
  validates :username, uniqueness: true

  def self.from_omniauth auth
    where(provider: auth["provider"], id: auth["uid"]).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth auth
    unless User.all.exists? auth["uid"]
      create! do |user|
        user.provider = auth["provider"]
        user.id = auth["uid"]
        user.email = auth["info"]["email"]
        user.username = auth["info"]["nickname"]
        user.first_name = auth["info"]["name"].split(" ")[0]
        user.last_name = auth["info"]["name"].split(" ")[1]
        user.password = "null"
      end
    end
  end

end
