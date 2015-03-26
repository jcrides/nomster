require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  test "get index" do
    create(:place)
    get :index
    assert_response :success
  end

  test "get place page" do
    place = create(:place)
    get :show, :id => place.id
    assert_response :success
  end

  test "get place page invalid id" do
    get :show, :id => "oops"
    assert_response :not_found
  end

  test "new place not signed in" do
    get :new
    assert_redirected_to new_user_session_path
  end

  test "new place signed in" do
    user = create(:user)
    sign_in user
    get :new
    assert_response :success
  end

  test "create place not signed in" do
    assert_no_difference 'Place.count' do
      post :create, { :place => {
        :name => "A place",
        :description => "Yeah it's a place",
        :address => "1 Market St, San Francisco, CA 94105"
        }
      }
    end
    assert_redirected_to new_user_session_path
  end

  test "create place signed in valid" do
    user = create(:user)
    sign_in user

    assert_difference 'Place.count' do
      post :create, { :place => {
        :name => "A place",
        :description => "Yeah it's a place",
        :address => "1 Market St, San Francisco, CA 94105"
        }
      }
    end
    assert_redirected_to root_path

    assert_equal 1, user.places.count
  end

  test "create place not valid" do
    user = create(:user)
    sign_in user

    assert_no_difference 'Place.count' do
      post :create, { :place => {
        :name => "A",
        :description => "",
        :address => "1 Market St, San Francisco, CA 94105"
        }
      }
    end

    assert_response :unprocessable_entity
  end

  test "edit place not logged in" do
    place = create(:place)
    get :edit, :id => place.id
    assert_redirected_to new_user_session_path
  end

  test "edit logged in as wrong user" do
    user = create(:user)
    sign_in user
    place = create(:place)
    get :edit, :id => place.id
    assert_response :unauthorized
  end

  test "edit valid place" do
    user = create(:user)
    place = create(:place, :user_id => user.id)
    sign_in user

    get :edit, :id => place.id
    assert_response :success
  end

  test "edit place not found" do
    sign_in create(:user)
    get :edit, :id => 'oops'
    assert_response :not_found
  end

  test "update place not logged in" do
    place = create(:place,)
    put :update, :id => place.id, :place => {:name => 'lol'}
    assert_redirected_to new_user_session_path
  end

  test "update as wrong user" do
    sign_in create(:user)
    place = create(:place)
    put :update, :id => place.id, :place => {:name => 'lol'}
    assert_response :unauthorized
  end

  test "update place successful" do
    user = create(:user)
    place = create(:place, :user_id => user.id)
    sign_in user

    put :update, :id => place.id, :place => {:name => 'lol'}
    assert_redirected_to root_path
    assert_equal 'lol', place.reload.name
  end

  test "update non-existent place" do
    user = create(:user)
    sign_in user
    put :update, { :id => 'oops', :place => { :name => 'omg' } }
    assert_response :not_found
  end

  test "update invalid name error" do
    user = create(:user)
    place = create(:place, :user_id => user.id)
    sign_in user

    put :update, :id => place.id, :place => {:name => '' }
    assert place.reload.name.present?
    assert_response :unprocessable_entity
  end

  test "destroy when not logged in" do
    place = create(:place)
    assert_no_difference 'Place.count' do
      delete :destroy, :id => place.id
    end
    assert_redirected_to new_user_session_path
  end

  test "destroy wrong user" do
    user = create(:user)
    place = create(:place)
    sign_in user

    assert_no_difference 'Place.count' do
      delete :destroy, :id => place.id
    end
    assert_response :unauthorized
  end

  test "destroy own place" do
    user = create(:user)
    place = create(:place, :user_id => user.id)
    sign_in user

    delete :destroy, :id => place.id
    assert_redirected_to root_path
    assert_nil Place.find_by_id(place.id)
  end

  test "destroy nonexistant place" do
    user = create(:user)
    sign_in user

    delete :destroy, :id => 'oops'
    assert_response :not_found
  end

end
