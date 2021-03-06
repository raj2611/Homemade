
class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :profilepic])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :profilepic])
  end
  
def after_sign_in_path_for(*)
    contents_path
  end
  def after_sign_up_path_for(*)
    contents_path
  end
   
end
