class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id).order("created_at DESC").page(params[:page]).per(4)
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(4)
  end
end
