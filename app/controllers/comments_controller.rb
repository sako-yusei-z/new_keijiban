class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.comments.new(comment_params)
    @post.touch
    @post.save

    return redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
