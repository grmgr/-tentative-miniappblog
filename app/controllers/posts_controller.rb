class PostsController < ApplicationController

  def index
    @posts = Post.order("created_at DESC").page(params[:page]).per(6)
  end

  def new
  end

  def create
    Post.create(name: post_params[:text], text: post_params[:text], user_id:current_user.id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)if post.user_id == current_user.id
    redirect_to("/")
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
    redirect_to("/")
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.permit(:name, :text)
  end

  def move_to_index
    unless user_signed_in?
    redirect_to action: :index
    end  # 未ログインはindex
  end
end