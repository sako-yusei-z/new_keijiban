class PostsController < ApplicationController
  def index
    @posts = Post.search(params[:search], params[:search_type])
  end

  def show
    @post = Post.find(params[:id])
    @tag = @post.tags
  end

  def new
    @post = Post.new
    @post.tags.build
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_tag_params)
    @tag = params[:post][:tags_attributes]['0'][:category]
    if tag = Tag.find_by(category: @tag)
      @post = @user.posts.build(post_params)
      @post.tags << tag
      if @post.save
        return redirect_to root_path
      else
        return render 'new'
      end
    elsif @post.save
        return redirect_to root_path
    else
      return render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(update_params)
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

  def post_tag_params
    params.require(:post).permit(:title, :body, tags_attributes: [:id, :category])
  end

  def update_params
    params.require(:post).permit(:title, :body, tags_attributes: [:id, :category, :_destroy])
  end
end
