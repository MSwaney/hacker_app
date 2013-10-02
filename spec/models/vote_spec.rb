require 'spec_helper'

describe Vote do
  it { should belong_to :post }

  it 'updates a posts popularity after every vote' do
    post = Post.create(title: 'Testing', link: 'www.nowhere.com')
    post.votes.create(vote: 1)
    Post.find(post.id).popularity.should eq 1
  end
end