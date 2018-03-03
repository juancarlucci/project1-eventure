class AttendanceController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @events = @user.events
  end

  def create
    @event = Event.find(params[:event_id])
    @event.users.push(current_user)  # no error handling currently

    redirect_to current_user
  end
end
