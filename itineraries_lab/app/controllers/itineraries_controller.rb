class ItinerariesController < ApplicationController
  
  def index

  end

  def new
  end

  def show
    @itinerary = Itinerary.find params[:id]
    @destinations = Destination.all
  end

  def edit
  end
end
