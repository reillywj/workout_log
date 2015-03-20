class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :user_is_coach?, :user_is_current_user_coach_or_admin?, :logged_in_coach_or_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def user_is_current_user?
    @user == current_user
  end

  def user_is_coach?
    logged_in? ? current_user == "Coach" : false
  end

  def logged_in_coach_or_admin?
    logged_in? and ["Coach", "Admin"].include?(current_user.role)
  end

  def user_is_current_user_or_admin?
    #TODO: must decide how to build out admin role.
  end

  def user_is_current_user_coach_or_admin?(user)
    current_user == user or ["Coach", "Admin"].include?(current_user.role)
  end

  def require_user
    if !logged_in?
      must_be_logged_in
    end
  end

  private
  def must_be_logged_in
    flash[:alert] = "Must be logged in to do that."
    redirect_to root_path
  end

  def must_be_admin
    flash[:alert] = "You are not allowed to do that."
    redirect_to root_path
  end
end
