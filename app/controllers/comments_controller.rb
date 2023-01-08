class CommentsController < ApplicationController
  before_action :set_post, only: %i[ new create ]
  before_action :set_comment, only: %i[ show edit update destroy ]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.create!(comment_params)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post }
    end
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:comment_id])
    end

    def comment_params
      params.require(:comment).permit(:comment)
    end
end
