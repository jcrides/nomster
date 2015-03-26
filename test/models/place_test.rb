require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  test "create place" do
    place = FactoryGirl.create(:place)
    assert place.valid?, "Place with all fields passing validation"
  end

end
