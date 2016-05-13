class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # include Pundit
  # after_action :verify_authorized
  # after_action :verify_policy_scoped, only: :index

  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :role, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
  end
  
  def after_sign_in_path_for(resource)
    "/#{current_user.username}/posts"
  end
  
  def require_editor
    redirect_to root_path unless current_user.editor?
  end
  
  # private
  #   def user_not_authorized
  #     flash[:alert] = "You are not authorized to perform this action."
  #     redirect_to(request.referrer || root_path)
  #   end
  
end
