class DestinationsController < ApplicationController
  def index
    @destination = Destination.all
  end
  def new
    @destination = Destination.new
  end

  def create 

    Destination.create destination_params
    redirect_to user_path(@user)
  end

  def add_destination
    # @itinerary = Itinerary.find (params[:id])
    #   destination = Destination.find(destination_params[:id])
    @itinerary = Itinerary.find params[:id]
    @destination = Destination.create(destination_params)
    if @destination.save
      @itinerary.destinations << destination
      redirect_to destination_path
    else
      render :new
    end

  end

  def show
   
      @destination = Destination.find params[:id]
   
  end

  def edit

  end
  private
   def destination_params
     params.require(:destination).permit(:name, :location, :start_date, :end_date)
   end
  
end
