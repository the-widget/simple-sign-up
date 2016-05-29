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
  
end
