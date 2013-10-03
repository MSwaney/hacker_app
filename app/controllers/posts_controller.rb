class PostsController < ApplicationController
  def index
    @posts = Post.ordered_by_popularity
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.ordered_comments
    @comment = @post.comments.new
    @sub_comment = @comment.comments.new
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to '/'
  end

  def edit
  end

  def update
  end

  def destroy
  end 

private

  def post_params
    params.require(:post).permit(:title, :link)
  end

end
