class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def authorize
    redirect_to user_path, alert: "Not authorized" if current_user.nil?
  end

end
