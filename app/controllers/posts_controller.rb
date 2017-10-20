class PostsController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
    else
      @user = User.find_by(params[:user_id])
    end
    @posts = Post.search(params[:search])
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = current_user
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
