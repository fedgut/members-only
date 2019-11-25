# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
  end

  def create
    puts params[:email]
    user = User.find_by(email: params[:email].to_s.downcase)
    if(user && user.authenticate(params[:password]))
      puts "logged in "
      log_in(user)
      current_user=(user)
    else
      puts "not logged in "
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def delete
    sing_out
  end
end
