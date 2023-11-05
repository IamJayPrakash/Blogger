# frozen_string_literal: true

class CommentsController < ApplicationController
  include CanCan::ControllerAdditions
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user

    # Load the comments and users for the post in a single query
    #  @post.preload(comments: :user)
    if @comment.save

      flash[:notice] = 'Comment has been made!'
    else
      # flash[:alert] = 'No comment has made ( Comment body cannot be blank)'
      flash[:alert] = 'Comment body cannot be blank.'
    end
    redirect_to post_path(@post)
  end

  def update
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_url(@post), notice: 'Comment has been updated.' }
      else
        format.html { redirect_to post_url(@post), alert: 'Comment could not be updated.' }
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def set_post
    # @post = Post.find(params[:post_id])
    @post = Post.includes(:comments).find(params[:post_id])
    @comments = @post.comments.paginate(page: params[:page], per_page: 5)
  end

  def comment_params
    params.require(:comment).permit(:body)
    # params.require(:comment).permit(:body).tap do |whitelisted|
    #   whitelisted[:body] = params[:comment][:body]
    # end
  end
end

# By using the `includes` method with `:comments`, you are eager loading the comments associated with the post.
# This will fetch all the comments in a single query instead of querying for each comment individually, thus resolving the N+1 query issue.
