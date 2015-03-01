class UsersController < ApplicationController
  before_action :prevent_logged_in_signup, only: [:signup, :create, :login]
  before_action :confirm_logged_in, only: [:index, :show, :edit, :update, :destroy]
  before_action :find_user, only: [:edit, :show, :update, :destroy, :add_itinerary]

  def index
    @users = User.all
  end

  def signup
    @user = User.new
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
    @user = User.find params[:id]
    @itineraries = User.all - @user.itineraries
    @comments = @user.comments
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

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_digest)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def prevent_logged_in_signup
    if session[:user_id]
      redirect_to user_path session[:user_id]
    end
  end

end