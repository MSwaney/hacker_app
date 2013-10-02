require 'spec_helper'

describe Post do
  it { should have_many :votes }
  it { should have_many(:comments).through(:commentable) }
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
    @post.reload
    @post.update(created_at: Time.now - 6.hours)
    @post.refresh_popularity
    Post.find(@post.id).popularity.should eq 8
  end
end
