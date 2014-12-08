require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  include FactoryGirl::Syntax::Methods
  
  should have_many(:projects).with_foreign_key('owner_id')
  
  test "that user password confirmation should match" do
    user = FactoryGirl.build(:user1)
    assert user.valid?
  end
  
end
