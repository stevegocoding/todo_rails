require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  include FactoryGirl::Syntax::Methods
  
  test "that user password confirmation should match" do
    user = FactoryGirl.build(:user2)
    assert user.valid?
  end
  
end
