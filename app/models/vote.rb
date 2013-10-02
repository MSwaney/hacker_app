class Vote < ActiveRecord::Base
  belongs_to :post

  after_create do
    post.update(popularity: post.popularity += self.vote)
  end
end
