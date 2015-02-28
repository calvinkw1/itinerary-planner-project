class ItinerariesController < ApplicationController
  
  def index

  end

  def new
    @itinerary = Itinerary.new
  end

  def show
    @itinerary = Itinerary.find params[:id]
    @destinations = @itinerary.destinations
  end

  def edit
  end
end
