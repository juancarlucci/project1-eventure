class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def index
    @users = User.all
    @user = User.new
  end

  def new
    @user= User.new
    redirect_to root_path
  end

  def create
    @user= User.new(user_params)
    if User.exists?(email: [@user.email])
      redirect_to login_path
      flash[:notice] = "User Exists!"
    else
      @user.save
      login(@user)
      redirect_to @user
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @events = Event.all
    @event= Event.find_by_id(params[:id])
  end

  def destroy
    # only let current_user delete their own account
    if current_user == @user
      @user.destroy
      session[:user_id] = nil
      flash[:notice] = "Successfully deleted profile."
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  def about
  end


  def about
    # redirect_to about_path

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
