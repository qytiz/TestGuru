# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :return_page

  private

  def authenticate_user!
    unless current_user
      cookies[:return_to] = request.original_url
      redirect_to login_path, alert: "Please,log in to get access to resources"
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def return_page
    cookies.delete(:return_to) || tests_path
  end
end
