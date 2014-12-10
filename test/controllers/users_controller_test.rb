require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "users routes" do
    assert_recognizes({controller: 'users', action: 'create'}, {path: '/users', method: :post})
  end
end
