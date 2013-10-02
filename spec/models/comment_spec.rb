require 'spec_helper'

describe Comment do
  it { should have_many(:comments).through(:commentable) }
  it { should belong_to :commentable }
end
