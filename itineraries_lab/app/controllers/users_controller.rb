class UsersController < ApplicationController
  
  def index
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

  def create
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path session[:user_id]
    else
      render :signup
    end
  end

  def show
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_digest)
  end

end
