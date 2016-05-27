class EventController < ApplicationController

  def index
    @events = Event.all 
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    @event.save
    redirect_to event_index_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date_time)
  end


end