class VotesController < ActionController::Base
  def create
    @vote = Vote.create(vote_params)
    redirect_to '/'
  end

private

  def vote_params
    params.require(:post).permit(:post_id, :vote)
  end
end