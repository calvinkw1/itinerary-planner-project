class ItinerariesController < ApplicationController
  before_action :confirm_logged_in
  before_action :find_itinerary, only: [:show, :edit, :update, :destroy]
  before_action :confirm_creator, only: [:update, :edit, :destroy]


  def index
    @user = User.find session[:user_id]
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
      redirect_to user_path(session[:user_id]), flash: {success: "New Trip Added"}
    else
      render :new
    end
  end

  def show
    @user = User.find session[:user_id]
    @itinerary = Itinerary.find params[:id]
    @destinations = @itinerary.destinations
    @companions = @itinerary.users
    @comments = @itinerary.comments
    
  end


  def edit
  end

  def update
    if @itinerary.update_attributes itinerary_params
      redirect_to @itinerary, flash: {notice: "Trip Updated"}
    else
      render :edit
    end
  end

  def destroy
    @itinerary.delete
    redirect_to user_path session[:user_id], flash: {alert: "Trip Cancelled"}
  end

  private
  def itinerary_params
    params.require(:itinerary).permit(:user_id, :name, :origin, :destination, :start_date, :end_date)
  end

  def find_itinerary
    session[:itinerary_id] = Itinerary.find params[:id]
    @itinerary = Itinerary.find params[:id]
  end

  def confirm_creator
    user = User.find session[:user_id]
    itinerary = Itinerary.find params[:id]
    unless user.itineraries.include? itinerary
      redirect_to itinerary_path params[:id], alert: "Only the creator can make changes!"
    end
  end

end

