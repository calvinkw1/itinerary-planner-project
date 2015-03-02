class DestinationsController < ApplicationController
  before_action :confirm_logged_in
  before_action :find_itinerary, only: [:new, :create, :add_destination, :destroy, :add_companion]
  before_action :find_destination, only: [:show, :edit, :update, :destroy, :add_companion]
  before_action :find_user, only: [:create]
  before_action :confirm_creator, only: [:edit]

  def index
    @user = User.find session[:user_id]
    @destination = Destination.all
  end
  
  def new
    
    @destination = Destination.new
  end

  def create 
    # itinerary = Itinerary.find params[:id]
    @destination = Destination.create destination_params
    if @destination.save
      @itinerary.destinations << @destination
      @destination.users << @user
      redirect_to itinerary_path(@itinerary), flash: {success: "Destination Added"}
    else
      render :new
    end
  end

  # def add_destination
  #   # @itinerary = Itinerary.find (params[:id])
  #   #   destination = Destination.find(destination_params[:id])
  #   # @itinerary = Itinerary.find params[:id]
  #   @destination = Destination.create(destination_params)
  #   if @destination.save
  #     redirect_to destination_path
  #   else
  #     render :new
  #   end
  #   Destination.create 
  # end

  def show
    @user = User.find session[:user_id]
    @current_companions = @destination.users
    @avail_companions = User.all - @current_companions
    @comments = @destination.comments
  end

  def add_companion
    companion = User.find user_params[:id]
    unless @destination.users.include? companion
      @destination.users << companion
      @itinerary.users << companion
    end
    redirect_to destination_path, flash: {success: "You added a friend to your trip!"}
  end

  def remove_companion
    user = User.find params[:user_id]
    itinerary = Itinerary.find session[:itinerary_id]["id"]
    destination = Destination.find params[:destination_id]
    destination.users.delete user
    if user.destinations.empty?
      itinerary.users.delete user
    end
    redirect_to destination_path(destination)
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
    @itinerary = Itinerary.find(session[:itinerary_id]["id"])
  end
  def find_user
    @user = User.find session[:user_id]
  end

  def user_params
    params.require(:user).permit(:id, :first_name)
  end

  def confirm_creator
    user = User.find session[:user_id]
    destination = Destination.find params[:id]
    unless user.destinations.include? destination
      redirect_to destination_path params[:id], alert: "Only the creator can make changes!"
    end
  end
  
end
