class EventsController < ApplicationController
    before_action :require_login, only: [:show, :index]
    def index
      @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.hosted_events.build(event_params)
        if @event.save
            redirect_to root_path, notice: 'Event has been created'
        else
            render 'new', notice: 'Try again'
        end
    end

    def update
        
    end

    def show
        # @event = Event.find_by(params[:id])
    end

    def my_events
        @event = current_user.hosted_events.first
    end

    def destroy
        @event = Event.find_by(params[:id])
        @event.destroy
        redirect_to root_path
    end

    private
    def event_params
        params.require(:event).permit(:event_name, :event_location, :event_date)
    end
end
