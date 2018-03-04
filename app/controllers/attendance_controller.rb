class AttendanceController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @events = @user.events
  end

  def create
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @user.events << @event  # no error handling currently

    redirect_to current_user
  end
end
