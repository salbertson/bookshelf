class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authorize_user

  helper_method :current_user

  def current_user
    @current_user = User.where(username: session[:username]).first
  end

  private

  def authorize_user
    redirect_to new_session_path unless session[:username]
  end
end
