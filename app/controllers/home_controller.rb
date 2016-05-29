class HomeController < ApplicationController

  def index
  end

  def set_role
    if current_user.role.nil?
      @user = current_user
      render 'devise/registrations/set_role'
    else
      redirect_to root_path
    end
  end

end