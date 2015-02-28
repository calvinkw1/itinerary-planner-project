class ItinerariesController < ApplicationController
  
  def index

  end

  def new
  end

  def show
    @itinerary = Itinerary.find params[:itinerary_id]
  end

  def edit
  end
end
