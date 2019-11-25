class PostsController < ApplicationController

  before_action :user_logged_in, only: %i[new create]

  def new
  end

  def create
  end

  def index
  end

  private 

  def user_logged_in
    unless logged_in?
      flash[:danger] = 'Please log in'
      redirect_to signin_path
  end

end
