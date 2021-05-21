class EventsController < ApplicationController
    before_action :require_login, only: [:show, :index]
    def index
      @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.hoster_events.build(event_params)
        if @event.save
            redirect_to @event, notice: 'Event has been created'
        else
            render 'new', notice: 'Try again'
        end
    end

    def show
        @event = Event.find(params[:id])
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
          redirect_to @event, notice: "Your event was updated"
        else
          render :edit
        end
    end

    def rsvp
        @event = Event.find(params[:id])
        if @event.attendees.include?(current_user)
            redirect_to @event, notice: 'You are already enrolled on this event.'
        else
            @event.attendees << current_user
            redirect_to @event, notice: 'You are now in line to attend this event.'
        end
    end

    def cancel_rsvp
        @event = Event.find(params[:id])
        @event.attendees.delete(current_user)
        redirect_to @event, notice: 'You are no longer on this event.'
    end

    def my_event
        @event = current_user.hoster_events.all
    end

    def destroy
        @event = Event.find_by(params[:id])
        @event.destroy
        redirect_to events_path
    end

    private
    def event_params
        params.require(:event).permit(:event_name, :event_location, :event_date)
    end
end
