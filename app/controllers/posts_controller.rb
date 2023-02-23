class PostsController < ApplicationController
 before_action :set_post, except: [:index, :new, :search, :create, :services_posts] #only: [:edit, :update, :destroy, :like_post]
 before_action  :set_like, only: :like_post
    def index
      current_user.id
      @posts = Post.all.include(:likes)
      render json: @posts
    end
    
    def new
     @post = Post.new
     render json: @post
    end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

    def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      if @post.save
        # redirect_to root_path
        render json: @post
      else
        render json: @post.errors.full_messages, status: :unprocessable_entity 
      end
    end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    current_user.id
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors.full_messages, status: :unprocessable_entity 
    end
  end

    def destroy
      @post = Post.find(params[:id])
      @post.delete
      redirect_to root_path, status: :see_other
    end
    
    def like_post
      if @current_user_like 
        @current_user_like.update(active: false)
      else
        @post.likes.create(user_id: current_user.id, active: true)
      end
      redirect_to root_path
    end

    def services_posts
      @posts = CarDekho.new.fetch
      render json: @posts
    end
        private
        def post_params
          params.require(:post).permit(:title, :description, :category_id, :active,:image)
        end

        def set_post
          @post = Post.find_by_id(params[:id])
          render json: {massage: "post not found"}, status: :not_found unless @post
        end

        def set_like
          @current_user_like = @post.likes.find_by(user_id: current_user.id)
        end
    end

