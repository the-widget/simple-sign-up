class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  

  
  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    class_attr_index = html_tag.index 'class="'
 
    if class_attr_index
      html_tag.insert class_attr_index+7, 'error '
    else
      html_tag.insert html_tag.index('>'), ' class="error"'
    end
  end

  def check_role
    if current_user.role.nil?
      redirect_to set_role_path
    end
  end

end
