require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "create user" do
    user = create(:user)
    assert user.valid?, "should be able to create a user"
  end
end
