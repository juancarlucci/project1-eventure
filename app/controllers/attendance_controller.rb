class AttendanceController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @events = @user.events
  end

  def create
    @event = Event.find(params[:event_id])
    if current_user.events.exists?(event_name: @event.event_name)
      flash[:notice] = "Event already in your calendar"
      redirect_to current_user
    else
    current_user.events << @event  # no error handling currently

    redirect_to current_user
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    # @event.destroy
    current_user.events.delete(@event)
    flash[:notice] = "Successfully removed event."
    redirect_to user_path(current_user)
  end
end
