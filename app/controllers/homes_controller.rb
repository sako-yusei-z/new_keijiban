class HomesController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find_by(params[:user_id])
  end
end
