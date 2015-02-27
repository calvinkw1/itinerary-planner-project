class Join < ActiveRecord::Base
  belongs_to :user
  belongs_to :itinerary
  belongs_to :destination
end
