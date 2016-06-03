module ApplicationHelper

  def logged_in?
    !!current_user
  end

  def organizer_permissions?
    if logged_in?
      !!current_user.admin? || !!current_user.organizer?
    end
  end

  def oauth_login?
    !current_user.provider.nil?
  end

  def spots_to_fill
    task.workers_required - task.users
  end

  def task_styling
    @task.users.all.count == @task.workers_required ? "class=text-success" : "class=text-danger"
  end

  
  
end
