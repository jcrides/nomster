require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "create comment" do
    comment = create(:comment)
    assert comment.valid?
  end
end
