class ItinerariesController < ApplicationController
  before_action :find_itinerary, only: [:create, :show, :edit, :update, :destroy]


  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    user = User.find session[:user_id]
    @itinerary = Itinerary.create itinerary_params
    if @itinerary.save
      user.itineraries << @itinerary
      redirect_to user_path(session[:user_id])
    else
      render :new
    end
  end

  def show
    @itinerary = Itinerary.find params[:id]
    @destinations = @itinerary.destinations
    @companions = @itinerary.users
  end

  def add_companion
    @companions = @itinerary.users
    @companion = User.find companion_params[:id]
    unless @companions.include? @companion
      @companions << @companion
    end
    redirect_to @itinerary
  end

  def edit
  end

  def update
    @itinerary.update_attributes itinerary_params
    redirect_to @itinerary
  end

  def destroy
    @itinerary.delete
    redirect_to user_path session[:user_id]
  end

  private
  def itinerary_params
    params.require(:itinerary).permit(:user_id, :name, :origin, :destination, :start_date, :end_date)
  end

  def find_itinerary
    @itinerary = Itinerary.find params[:id]
  end

  def companion_params
    params.require(:user).permit(:id, :first_name, :last_name)
  end

end

