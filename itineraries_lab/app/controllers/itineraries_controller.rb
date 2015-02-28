class ItinerariesController < ApplicationController
  
  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
  end

  def add_itinerary
    @user = User.find(params[:id])
    itinerary = Itinerary.find(itinerary_params[:id])
    unless @user.itineraries.include? itinerary
      @user.itineraries << itinerary
    end
    redirect_to @user
  end

  def show
    @itinerary = Itinerary.find params[:id]
    @destinations = @itinerary.destinations
  end

  def edit
    @itinerary = Itinerary.find params[:id]
  end




end
