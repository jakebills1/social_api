class Api::V1::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_like, only: [:show, :update, :destroy]

  def index
    render json: @post.likes
  end

  def show
    render json: @like
  end

  def create
    like = @post.likes.create(like_params)
    if like.save
      render json: like
    else
      render json: like.errors
    end
  end

  def update
    if @like.update(like_params)
      render json: @like
    else
      render json: @like.errors
    end
  end

  def destroy
    @like.destroy
    render json: { message: "Like deleted!" }
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_like
    @like = @post.likes.find(params[:id])
  end

  def like_params
    params.require(:like).permit()
  end
end
