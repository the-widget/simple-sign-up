module ApplicationHelper

  def logged_in?
    !!current_user
  end

  def organizer_permissions?
    if logged_in?
      !!current_user.admin? || !!current_user.organizer?
    end
  end
  
end
