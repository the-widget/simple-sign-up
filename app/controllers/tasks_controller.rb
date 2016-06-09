class TasksController < ApplicationController

  def show
    @task = Task.find(params[:id])
    @users = @task.users
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @task}
    end
  end

  def new
    @task = Task.new
  end

  def create
    set_event
    @task = @event.tasks.build(task_params)
    if !@task.save
      render 'new'
    else
      redirect_to event_task_path(@event, @task)
    end
  end

  def set_role
    @task = task
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
    elsif organizer_permissions?
      task.update(task_params)
      redirect_to event_path(@event)
    end
  end

  def sign_up
    @task = task
    set_event
    @usertask = task.user_tasks.find_or_create_by(user_id: current_user.id, task_id: @task.id)
    @usertask.update(task_role: params['user']['task_role'])
    flash[:notice] = "Successfully added you to this task."
    redirect_to event_task_path(@event, @task)
  end

  def task
    Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :start_time, :end_time, :workers_required, :id)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  
  
end