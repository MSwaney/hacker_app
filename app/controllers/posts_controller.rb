class PostsController < ActionController::Base
  def index
    Post.all.each { |post| post.refresh_popularity }
    @posts = Post.all
  end

  def show
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
