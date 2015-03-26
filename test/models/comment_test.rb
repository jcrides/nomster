require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "comment should be invalid with bad rating" do
    comment = build(:comment, :rating => "oops")
    assert_not comment.valid?
  end
end
