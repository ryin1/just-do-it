class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_lists_and_users
  helper_method :current_user
  helper_method :logged_in?

  def set_lists_and_users
    @users = User.all
    @lists = current_user.lists if logged_in?
  end

  # Helper methods: Logged in, current user

  def logged_in?
    session[:user_id]
  end

  def current_user
    User.find(session[:user_id]) if logged_in?
  end
end
