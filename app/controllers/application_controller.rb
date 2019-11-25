# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
    user.remember
    user.save
    cookies.permanent[:remember_token] = user.remember_token

    redirect_to(session[:forwarding_url] || user)
  end

  def sing_out
    cookies.delete(:remember_token)
    @current_user = nil
    redirect_to home_pathgit add 
  end
end
