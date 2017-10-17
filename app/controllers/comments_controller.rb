class CommentsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @post.comments.new(comment_params)
    @post.touch
    @post.save

    return redirect_to user_post_path(@user, @post)
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
