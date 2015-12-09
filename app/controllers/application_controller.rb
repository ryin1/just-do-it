class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_lists_and_users

  def set_lists_and_users
    @users = User.all
    @lists = current_user.lists if logged_in?
  end

  # Helper methods: Logged in, current user

  helper_method def logged_in?
    session[:user_id]
  end

  helper_method def current_user
    User.find(session[:user_id]) if logged_in?
  end
end
