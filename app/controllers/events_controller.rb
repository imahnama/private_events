class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def index
    @events = Event.all
    @previous_events = Event.previous
    @upcoming_events = Event.upcoming
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :description, :date)
  end
end
