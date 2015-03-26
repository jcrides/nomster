require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "not logged in fails comment create" do
    post :create, :place_id => '1'
    assert_redirected_to new_user_session_path
  end

  test "user can create comment" do
    user = create(:user)
    sign_in user
    place = create(:place, :user_id => user.id)
    assert_difference 'place.comments.count' do
      post :create, :place_id => place.id, :comment => {
                  :rating => '4',
                  :message => 'Get the message',
                  :user_id => user.id
                  }
    end
    assert_redirected_to place_path(place)
    comment = Comment.last
    assert_equal user, comment.user
  end

  test "can't create comment without a valid place" do
    user = create(:user)
    sign_in user
    post :create, :place_id => 'nope'
    assert_response :not_found
  end

end
