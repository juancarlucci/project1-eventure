class EventsController < ApplicationController
  def index
      @events = Event.all
    end

    def new
      @event = Event.new
    end

    def create
      puts "\n\n PARAMS: #{params} \n\n"
      # @event = Event.create(event_params)
      # redirect_to events_path

      # @user = User.find(params[:user_id])
      # @event= Event.new(post_permit)
      # @user = User.find(params[:user_id])
      # @event = Event.find(params[:event_id])
      # @user.events << @event

      # if(@event.save)
      #   # @user.events << @event
      #   render json: @event
      # end
    end
    def add
      @user = User.find(params[:user_id])
<<<<<<< HEAD
      # TODO: check if event is already in db
      @look_for_event = Event.find_by(:event_name, event_params[:event_name])
      if @look_for_event != nil
        # we found the event
        #T ODO: Make an attendencce connection
        @look_for_event.users << current_user
        if @look_for_event.save
          render json: @look_for_event.to_json
        end
      else
        @event= Event.new(params)
        @event.users << current_user
        if(@event.save)
          render json: @event.to_json
        end
      end
=======
      @event = Event.find(params[:event_id])
      @user.events << @event  # no error handling currently

      redirect_to current_user
>>>>>>> fb585de33ae2a0d6c1286d3a1f2d4efd6d0e2533
    end



    def show
      # @event = Event.find_by_id(params[:id])
      @events = Event.all

    end

    def destroy
      @event = Event.find_by_id(params[:id])
      @event.destroy
      flash[:notice] = "Successfully removed event."
      redirect_to user_path(current_user)
    end


    private

    def event_params
      params.permit(:event_name, :event_location, :event_date, :event_url, :event_description, :event_image)
    end
    def post_permit
      params.permit(:event_name)
    end
end
