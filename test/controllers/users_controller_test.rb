require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "show found user" do
    user = create(:user)
    get :show, :id => user.id
    assert_response :success
  end

  test "show not found user" do
    get :show, :id => "oops"
    assert_response :not_found
  end

end
