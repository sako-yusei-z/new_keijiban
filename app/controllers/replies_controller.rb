class RepliesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @comment.replies.new(reply_params)
    @comment.save
    
    @post.touch
    @post.save

    return redirect_to user_post_path(@user, @post)
  end

  private
  
  def reply_params
    params.require(:reply).permit(:body, :user_id)
  end
end
