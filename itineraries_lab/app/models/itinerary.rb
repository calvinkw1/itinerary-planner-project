class Itinerary < ActiveRecord::Base
  has_many :joins
  has_many :users, through: :joins
  has_many :destinations, through: :joins

  has_many :comments, as: :commentable
  
  validates :name, :origin, :destination, :start_date, :end_date, presence: true
end
