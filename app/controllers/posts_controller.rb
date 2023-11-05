# frozen_string_literal: true

class PostsController < ApplicationController
  include CanCan::ControllerAdditions

  load_and_authorize_resource

  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[show index]
  # GET /posts or /posts.json

  def index
    # @posts = Post.all.order(created_at: :desc)
    @posts = Post.page(params[:page]).per(3).order(created_at: :desc)

    # @post = Post.order(:posts).page(params[:posts]).per(10)
  end

  # def upvote
  #   @post = Post.find(params[:id])
  #   if current_user.voted_up_on? @post
  #     @post.unvote_by current_user
  #   else
  #     @post.upvote_by current_user
  #   end
  #   render 'vote.js.erb'
  # end

  # def downvote
  #   @post = Post.find(params[:id])
  #   if current_user.voted_down_on? @post
  #     @post.unvote_by current_user
  #   else
  #     @post.downvote_by current_user
  #   end
  #   render 'vote.js.erb'
  # end

  # GET /posts/1 or /posts/1.json
  def show
    @post.update(view: @post.view + 1)
    # @comments = @post.comments.order(created_at: :desc)
    @comments = @post.comments.order(created_at: :desc).paginate(page: params[:page], per_page: 3)

    mark_notifications_as_read
    # views=@post.view+1
    # @post.view=views
    # @post.save
    # Get the post's likes.
    # Get the post's likes, if they exist.
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  # POST /posts or /posts.json
  def edit; end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        PostMailer.with(user: current_user, post: @post).post_created.deliver
        format.html { redirect_to post_url(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # def like
  #   @post = Post.find(params[:id])
  #   @post.increment!(:likes_count)
  #   render json: { likes_count: @post.likes_count }

  # end
  def like
    # binding.pry

    @post = Post.find(params[:id])
    like = @post.likes.find_by(user: current_user)

    if like
      like.destroy
      @post.decrement!(:likes_count)
    else
      @post.likes.create(user: current_user)
      @post.increment!(:likes_count)
    end

    respond_to do |format|
      # format.html { redirect_to posts_url }
      # format.json { render json: { likes_count: @post.likes_count } }
      format.json { render json: { likes_count: @post.likes_count }.to_json }
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    # @post.soft_delete
    respond_to do |format|
      format.html { redirect_to posts_url, alert: 'Post was successfully deleted' }
      format.json { head :no_content }
    end
  end

  # def truncate_post_body(post)
  #   post.body.truncate(150)
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def mark_notifications_as_read
    return unless current_user

    notifications_to_mark_as_read = @post.notifications_as_post.where(recipient: current_user)
    notifications_to_mark_as_read.update_all(read_at: Time.zone.now)
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :avatar, :remove_avatar, :avatar_cache)
    # params.require(:post).permit(:title, :body, :avatar).tap do |whitelisted|
    #   whitelisted[:body] = params[:post][:body]
    # end
  end
end
