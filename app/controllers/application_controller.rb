class ApplicationController < ActionController::Base
  # include Authentication

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = 'In order to list a pet please sign in or sign up.'
    # redirect_to root_path
    redirect_to new_user_session_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :phone
  end
end

