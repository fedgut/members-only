# frozen_string_literal: true

class UsersController < ApplicationController
  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(post_params)
    if @user.save
      log_in(@user)
    else
      render 'new'
      flash[:danger] = 'User not created'
    end
  end

  private

  def post_params
    params.require(:user).permit(:username, :password, :email)
  end
end
