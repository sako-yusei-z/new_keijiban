class PostsController < ApplicationController
  def index
    if params[:post_search] == 'title'
      @posts = Post.title_search(params[:search])
    elsif params[:post_search] == 'tag'
      @posts = Post.tag_search(params[:search])
    else
      @posts = Post.all
    end
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
    @post = @user.posts.build(post_params)
    @category = params[:post][:tags_attributes]['0'][:category].split(',')
    any = @category
    @category.count.times do |i|
      if @tag = Tag.find_by(category: any[i])
        @tag.update_attributes(updated_at: Time.zone.now)
      end
    end
    @post.save
    @category.count.times do |i|
      if @tag = Tag.find_by(category: any[i])
        PostTag.create(post_id: @post.id, tag_id: @tag.id)
      else
        Tag.create(category: any[i])
        @new_tag = Tag.find_by(category: any[i])
        PostTag.create(post_id: @post.id, tag_id: @new_tag.id)
      end
    end
    return redirect_to root_path
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

  def update_params
    params.require(:post).permit(:title, :body, tags_attributes: [:id, :category, :_destroy])
  end
end
