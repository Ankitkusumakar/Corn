class UserController < ApplicationController
  def index
    @posts = Post.all.includes(:likes)
    render json: @posts
  end
end