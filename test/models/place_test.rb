require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  test "create place" do
    place = FactoryGirl.create(:place)
    assert place.valid?, "Place with all fields passing validation"
  end

  test "create place with name too short" do
    place = FactoryGirl.build(:place, :name => "Hi")
#    place = FactoryGirl.create(:place, :name => "Hi")
    # place = Place.create(:name => "Hi",
    #                      :address => "1 Market St, San Francisco, CA 94105",
    #                      :description => "A nice place")
    assert_not place.valid?, "Place with 2 character name should fail"
#    assert_not place.errors
  end

  test "create place with missing name" do
    place = Place.create(:name => "",
                         :address => "1 Market St, San Francisco, CA 94105",
                         :description => "A nice place")
    assert_not place.valid?, "Place with no name should fail"
  end

end
