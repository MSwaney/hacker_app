require 'spec_helper'

describe Post do
  it { should have_many :votes }
  it { should have_many(:comments) }
  it { should validate_presence_of :title }
  it { should validate_presence_of :link }
  it { should ensure_length_of(:title).is_at_most(50) }

  before do
    @post = Post.create(title: "Stuff and junk", link: "www.epicodus.com")
  end

  it "saves all links with a preceding 'http://'" do
    @post.link.should eq "http://www.epicodus.com" 
  end

  it 'has an initial popularity of 0' do
    @post.popularity.should eq 0
  end

  it "subracts from popularity as time passes" do
    10.times do
      @post.votes.create(vote: 1)
    end
    @post.update(created_at: Time.now - 9.hours)
    Post.refresh_popularity
    @post.votes.create(vote: 1)
    Post.find(@post.id).popularity.should eq 8
  end

  it "orders posts by popularity and then time created" do
    @post1 = Post.create(title: "Stuff", link: "www.epicodus.com")
    @post2 = Post.create(title: "Junk", link: "www.epicodus.com")
    @post1.votes.create(vote: 1)
    @post2.votes.create(vote: 1)
    @post2.votes.create(vote: 1)
    @post1.update(created_at: Time.now - 1.hour)
    @post2.update(created_at: Time.now - 2.hours)
    Post.ordered_by_popularity.last.should eq @post
  end

  it "orders comments by time created" do
    comment1 = @post.comments.create(content: "Things")
    comment2 = @post.comments.create(content: "I love things!")
    comment2.update(created_at: Time.now - 1.hour)
    @post.ordered_comments.last.should eq comment2
  end
end
