class TaskController < ApplicationController

  def show
    @task = task
    @users = @task.users
  end

  def new
    @task = Task.new
  end

  def create
    set_event
    @task = @event.tasks.build(task_params)
    @task.save
    redirect_to event_path(@event)
  end

  def destroy
    set_event
    task.destroy
    redirect_to event_path(@event)
  end

  def edit
    @task = task
  end

  def update
    set_event
    if current_user.member?
      sign_up
    elsif current_user.admin?
      task.update(task_params)
      redirect_to event_path(@event)
    end
  end

  def sign_up
    task.users << current_user unless task.users.include?(current_user)
    set_event
    flash[:notice] = "Successfully added you to this task."
    redirect_to event_path(@event)
  end

  def task
    Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :time)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
  
end