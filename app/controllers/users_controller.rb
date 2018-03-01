class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def new
    @user= User.new
  end

  def create
    if current_user == @user
      if @user.update_attributes(user_params)
        flash[:notice] = "Successfully updated profile."
        redirect_to user_path(@user)
      else
        flash[:error] = @user.errors.full_messages.join(", ")
        redirect_to edit_user_path(@user)
      end
    else
      redirect_to user_path(current_user)
    end
  end

  def show
  end

  def destroy
    # only let current_user delete their own account
    if current_user == @user
      @user.destroy
      session[:user_id] = nil
      flash[:notice] = "Successfully deleted profile."
      redirect_to root_path
    else
      redirect_to user_path(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
