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

  def refresh_popularity
    self.popularity -= ((Time.now - self.created_at) / 3.hour).to_i
    if self.popularity < 0 
      self.update(popularity: 0)
    else
      self.update(popularity: self.popularity)
    end
  end

end
