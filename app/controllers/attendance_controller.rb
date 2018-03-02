class AttendanceController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @events = @user.events
  end

  def create
    @library = Library.find(params[:library_id])
    @library.users.push(current_user)  # no error handling currently

    redirect_to current_user
  end
end
