class HomeController < ApplicationController
   skip_before_action :authenticate_user!

  def index
    if logged_in?
      redirect_to events_path
    end
  end

  def set_role
    if current_user.role.nil?
      @user = current_user
      render 'devise/registrations/set_role'
    else
      redirect_to events_path
    end
  end

end