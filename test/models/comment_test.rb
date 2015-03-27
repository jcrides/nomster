require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "comment should be invalid with bad rating" do
    comment = create(:comment)
    assert comment.valid?
  end
end
