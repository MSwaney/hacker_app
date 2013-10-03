class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    post = @comment.post
    redirect_to "/posts/#{post.id}"
  end

private

  def comment_params
    params.require(:comment).permit(:content, :commentable_type, :commentable_id)
  end

end