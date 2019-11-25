# frozen_string_literal: true

module SessionsHelper
  def logged_in?
    !current_user.nil?
  end

  def current_user
    @current_user  ||= User.find_by(remember_token: cookies[:remember_token])
  end

  def current_user=(user)
    @current_user = user
  end
end
