require 'spec_helper'

describe Comment do
  it { should belong_to :commentable }
  it { should have_many(:comments) }

  before do
    @post = Post.create(title: "Stuff and junk", link: "www.epicodus.com")
    @comment = Comment.create!(:content => 'i hate this', :commentable => @post)
  end

  it 'should belong to a post through its parent comments' do
    nested_comment = Comment.create!(:content => 'i hate you', :commentable => @comment)
    nested_comment.post.should eq @post
  end

  # it 'should sort comments newest to oldest' do
  #   3.times do
  #     @comment.comments.create!(:content => 'Michal rocks')
  #   end
  #   last_comment = @comment.comments.first
  #   last_comment.update(created_at: Time.now - 1.hour)
  #   @comment.sorted.last.should eq last_comment
  # end

end
