# frozen_string_literal: true

# app/controllers/posts_controller.rb

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.order('created_at DESC')
    @rows = [[]]
    @posts.each do |post|
      @rows << [] unless @rows[-1].length < 3
      @rows[-1] << post
    end
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :remove_image, :image_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
