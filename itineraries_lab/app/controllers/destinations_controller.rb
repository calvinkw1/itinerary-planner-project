class DestinationsController < ApplicationController
  before_action :find_itinerary, only: [:new, :create, :add_destination]
  before_action :find_destination, only: [:creat, :show, :edit, :update, :destroy]
  def index
    @destinations = Destination.all
  end
  def new
    
    @destination = Destination.new
  end

  def create 
    itinerary = Itinerary.find params[:id]

    @destination = Destination.create destination_params
    if @destination.save
      itinerary.destinations << @destination
      redirect_to itinerary_path(@itinerary)
    else
      render :new
    end
  end

  def add_destination
    # @itinerary = Itinerary.find (params[:id])
    #   destination = Destination.find(destination_params[:id])
    # @itinerary = Itinerary.find params[:id]
    @destination = Destination.create(destination_params)
    if @destination.save
      
      redirect_to destination_path
    else
      render :new
    end

  end

  def show
  end

  def edit
  end

  def update 
    @destination.update_attributes destination_params
    redirect_to @destination
  end

  def destroy
    @destination.delete
    redirect_to itinerary_path(@itinerary)
  end
  private
   def destination_params
     params.require(:destination).permit(:name, :location, :start_date, :end_date)
   end
   def find_destination
    @destination = Destination.find params[:id]
   end
   def find_itinerary
     @itinerary = Itinerary.find params[:id]
   end
  
end
