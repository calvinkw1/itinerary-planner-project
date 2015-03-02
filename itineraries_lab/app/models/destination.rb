class Destination < ActiveRecord::Base
  has_many :joins
  has_many :users, through: :joins
  has_many :itineraries, through: :joins

  has_many :comments, as: :commentable
  
  validates :name, :location, :start_date, :end_date, presence: true

  # validates :end_date, date: { after: :start_date, message: 'must be AFTER start date.'}
              
end
