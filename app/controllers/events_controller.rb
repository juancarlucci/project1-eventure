class EventsController < ApplicationController
  def index
      @events = Event.all
    end

    def new
      @event = Event.new
    end

    def create
      # @event = Event.create(event_params)
      # redirect_to events_path
      @event=Event.new(post_permit)
      if(@event.save)
      render json: @event
      end
    end

    def show
      # @event = Event.find_by_id(params[:id])
      @events = Event.all

    end

    def destroy
      @event = Event.find_by_id(params[:id])
      @event.destroy
      flash[:notice] = "Successfully removed event."
      redirect_to root_path
    end


    private

    def event_params
      params.require(:event).permit(:event_name, :event_location, :event_date, :event_url, :event_description, :event_image)
    end
    def post_permit
      params.permit(:event_name)
    end
end
