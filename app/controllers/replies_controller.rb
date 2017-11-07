class RepliesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @comment.replies.new(reply_params)
    @comment.save

    @post.touch
    @post.save

    return redirect_to post_path(@post)
  end

  private

  def reply_params
    params.require(:reply).permit(:body, :user_id, :post_id)
  end
end
