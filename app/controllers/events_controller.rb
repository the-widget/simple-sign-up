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
    if empty_task_params_field?
      @event = current_user.events.build(event_params)
      if @event.save 
        redirect_to(event_path(@event))
      else
        @event.tasks.build
        render('new')
      end
    else
      @event = current_user.events.build(event_with_task_params)
      @event.save ? redirect_to(event_path(@event)) : render('new')
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
    params.require(:event).permit(:title, :description, :date, :start_time, :end_time)
  end

  def event_with_task_params
    params.require(:event).permit(:title, :description, :date, :start_time, :end_time, tasks_attributes: [:title, :description, :start_time, :end_time, :workers_required, :id])
  end

  def empty_task_params_field?
    param = params["event"]["tasks_attributes"]["0"]
    param["title"].empty? && param["description"].empty? && param["start_time"].empty? && param["end_time"].empty? && param["workers_required"].empty?
  end

  def set_event
    @event = Event.find(params[:id])
  end


end