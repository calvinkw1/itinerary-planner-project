class DestinationsController < ApplicationController
  def index
    @destination = Destination.all
  end
  def new
    @destination = Destination.new
  end

  def create 
    Destination.create 
  end

  def show
      # @itinerary = Itinerary.find params[:id]
      @destination = Destination.find params[:id]
    # @destination = @itinerary.destination
  end

  def edit

  end
  private
  # def destination_params
  #   params.require(:destination).permit(:name, :location, :start_date, :end_date)
  # end
  
end
