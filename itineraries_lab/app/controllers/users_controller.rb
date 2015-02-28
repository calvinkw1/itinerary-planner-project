class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :show, :update, :destroy, :add_itinerary]
  
  def index
    @users = User.all
  end

  def create
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path session[:user_id]
    else
      render :signup
    end
  end

  def signup
    @user = User.new
  end

  def login
    if params[:username].present? && params[:password].present?
      found_user = User.find_by_username params[:username]
      if found_user
        authorized_user = found_user.authenticate params[:password]
      end
    end
    if !found_user
      render :login
    elsif !authorized_user
      render :login
    else
      session[:user_id] = authorized_user.id
      redirect_to user_path session[:user_id]
    end
  end

  def show
    @itineraries = User.all - @user.itineraries
    # @comments = @user.comments
  end

  def edit
  end

  def update
    @user.update_attributes user_params
    redirect_to @user
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def add_itinerary
    @user = User.find(params[:id])
    itinerary = Itinerary.find(itinerary_params[:id])
    unless @user.itineraries.include? itinerary
      @user.itineraries << itinerary
    end
    redirect_to @user
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_digest)
  end

  def find_user
    @user = User.find(params[:id])
  end

end