require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "comment created" do
    comment = create(:comment)
    email = NotificationMailer.comment_added(comment).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['nomster@emailbistro.com'], email.from
    assert_equal [comment.place.user.email], email.to
    assert_match 'A comment was added to', email.subject

  end
end
