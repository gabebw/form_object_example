class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by_id(cookies[:id])
  end

  def set_current_user(user)
    cookies[:id] = user.id
  end
end
