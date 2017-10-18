class HomesController < ApplicationController
  def index
    @posts = Post.all
    if user_signed_in?
      @user = current_user
    else
      @user = User.find_by(params[:user_id])
    end
  end
end
