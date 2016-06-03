class EventsController < ApplicationController

  def index
    @events = Event.all 
  end

  def show
    set_event
  end

  def new
    @event = Event.new
    @event.tasks.build
  end

  def create
    @event = current_user.events.build(event_params)
    if !@event.save 
      render 'new'
    else 
      redirect_to event_path(@event)
    end
  end

  def edit
    set_event
  end

  def update
    set_event
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    set_event
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :start_time, :end_time, tasks_attributes: [:title, :description, :start_time, :end_time, :workers_required, :id])
  end

  def set_event
    @event = Event.find(params[:id])
  end


end