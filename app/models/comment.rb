class Comment < ActiveRecord::Base
  
  belongs_to :commentable, polymorphic: true
  # belongs_to :post 
  has_many :comments, as: :commentable

  def post
    if self.commentable_type == 'Post'
      self.commentable
    else
      self.commentable.post
    end
  end

  # def sorted
  #   comments.order("created_at DESC")
  # end
end
