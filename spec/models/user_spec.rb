require 'spec_helper'

describe User do
  it { should have_many :posts }
  it { should have_secure_password }
  it { should validate_presence_of :email }
end
