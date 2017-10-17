class PostsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @user.posts.new(post_params)
    if @user.save
      return redirect_to root_path
    else
      return render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      return redirect_to root_path
    else
      return render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    return redirect_to root_path
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
