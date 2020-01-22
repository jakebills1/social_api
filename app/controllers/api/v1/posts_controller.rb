class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_profile
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    render json: @profile.posts
  end

  def show
    render @post
  end

  def create
    post = @profile.posts.create(post_params)
    if post.save
      render json: post
    else
      render json post.errors
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors
    end
  end

  def destroy
    @post.destroy
    render json: { message: "Post deleted" }
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def set_post
    @post = @profile.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
