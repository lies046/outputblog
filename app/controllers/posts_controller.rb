class PostsController < ApplicationController
  before_action :move_to_index
  
  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(8)
  end

  def new
    @post = Post.new
  end

  def create
  @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash.now[:alert] = 'メッセージを入力してください。'
      redirect_to("/posts/new")
    end
 end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    
    if post.save
      redirect_to posts_path(post.id)
     
    else
      redirect_to("/posts/#{post.id}/edit")
    end
  end

  def destroy
  post = Post.find(params[:id])
  post.destroy
  redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :image).merge(user_id: current_user.id)
  end
  
  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
