# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :user_logged_in, only: %i[new create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    if @post.save
      redirect_to posts_url
    else
      render 'new'
      flash[:danger] = 'Post not created'
    end
  end

  def index
    @posts = Post.all
  end

  private

  def user_logged_in
    unless logged_in?
      flash[:danger] = 'Please log in'
      redirect_to signin_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
