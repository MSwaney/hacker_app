class Post < ActiveRecord::Base
  validates :link, presence: true
  validates :title, presence: true,length: {maximum: 50}
  has_many :votes
  has_many :comments, as: :commentable

  before_save do 
    if !self.link.include? "http"
      self.link = 'http://' + self.link
    end
  end

  def self.refresh_popularity
    Post.all.each do |post|
      post.popularity -= ((Time.now - post.created_at) / 3.hour).to_i
      if post.popularity < 0 
        post.update(popularity: 0)
        # prevents a post from being voted up once 3 hours and the post has reached 0 popularity has passed as each vote will reset it to 0 because this function is run after EVERY vote
      else
        post.update(popularity: post.popularity)
      end
    end
  end

  def self.ordered_by_popularity
    Post.refresh_popularity
    Post.all.order("popularity DESC, created_at DESC")
  end

  def ordered_comments
    self.comments.order("created_at DESC")
  end

end
